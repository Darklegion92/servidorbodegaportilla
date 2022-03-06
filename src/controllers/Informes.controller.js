const pool = require('../config/database')

async function salesProduct (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { dateInitial, dateFinish, name = '', groupId, subgroupId } = req.query

  let sql = `select sum(o.id) as salesCount, d.codigoarticulo as barcode, d.nombrearticulo as productName,
  sum(d.preciound * d.cantidad) as salesTotal, 
  (select ga.nombre from articulos aa, grupos ga where aa.idgrupo = ga.id and codigo = d.codigoarticulo)  as nameGroup,
  (select sa.nombre from articulos aa, subgrupos sa where aa.idsubgrupo=sa.id and codigo = d.codigoarticulo)  as nameSubgroup
  from ordenes o, orden_detalles d, articulos a, grupos g, subgrupos s 
  where o.id = d.idorden and a.codigo = d.codigoarticulo and a.idgrupo = g.id and g.id = s.idgrupo
  and a.idsubgrupo = s.id and o.finalizada = 1 
  and o.fecha >= ? and o.fecha < ? 
  and d.nombrearticulo like ? 
  group by d.codigoarticulo, d.nombrearticulo`
  let params = [dateInitial, dateFinish, `%${name}%`]

  if (groupId && subgroupId) {
    sql = `select sum(o.id) as salesCount, d.codigoarticulo as barcode, d.nombrearticulo as productName,
    sum(d.preciound * d.cantidad) as salesTotal, 
    (select ga.nombre from articulos aa, grupos ga where aa.idgrupo = ga.id and codigo = d.codigoarticulo)  as nameGroup,
    (select sa.nombre from articulos aa, subgrupos sa where aa.idsubgrupo=sa.id and codigo = d.codigoarticulo)  as nameSubgroup
    from ordenes o, orden_detalles d, articulos a, grupos g, subgrupos s 
    where o.id = d.idorden and a.codigo = d.codigoarticulo and a.idgrupo = g.id and g.id = s.idgrupo
    and a.idsubgrupo = s.id and o.finalizada = 1 
    and o.fecha >= ? and o.fecha < ?
    and g.id = ? and s.id = ? 
    and d.nombrearticulo like ? 
    group by d.codigoarticulo, d.nombrearticulo`
    params = [dateInitial, dateFinish, groupId, subgroupId, `%${name}%`]
  }else if(groupId){
    sql = `select sum(o.id) as salesCount, d.codigoarticulo as barcode, d.nombrearticulo as productName,
    sum(d.preciound * d.cantidad) as salesTotal, 
    (select ga.nombre from articulos aa, grupos ga where aa.idgrupo = ga.id and codigo = d.codigoarticulo)  as nameGroup,
    (select sa.nombre from articulos aa, subgrupos sa where aa.idsubgrupo=sa.id and codigo = d.codigoarticulo)  as nameSubgroup
    from ordenes o, orden_detalles d, articulos a, grupos g, subgrupos s 
    where o.id = d.idorden and a.codigo = d.codigoarticulo and a.idgrupo = g.id and g.id = s.idgrupo
    and a.idsubgrupo = s.id and o.finalizada = 1 
    and o.fecha >= ? and o.fecha < ?
    and g.id = ?
    and d.nombrearticulo like ? 
    group by d.codigoarticulo, d.nombrearticulo`
    params = [dateInitial, dateFinish, groupId, `%${name}%`]
  }

  try {
    const result = await pool.query(sql, params)
    res.status(200).send(result)
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function salesCustomer (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { dateInitial, dateFinish, name = '' } = req.query

  const sql = `select count(o.telefonocliente) as salesCount, sum(d.preciound * d.cantidad) as salesTotal, 
  o.telefonocliente as phone,
  (select concat(c.nombres,' ',c.apellidos) from clientes c where c.celular = o.telefonocliente limit 1) as name,
  (select c.documento from clientes c where c.celular = o.telefonocliente limit 1) as identification,
  (select c.email from clientes c where c.celular = o.telefonocliente limit 1) as email
  from ordenes o, orden_detalles d
  where o.id = d.idorden 
  and o.finalizada = 1
  and o.fecha >= ? and o.fecha < ?
  and (o.nombrecliente like ? or o.apellidoscliente like ? or o.telefonocliente like ? )
  group by o.telefonocliente`

  const params = [
    dateInitial,
    dateFinish,
    `%${name}%`,
    `%${name}%`,
    `%${name}%`
  ]
  try {
    const result = await pool.query(sql, params)
    res.status(200).send(result)
  } catch (e) {
    res.status(400).send({
      mensaje: `Error al realizar la consulta ${e}`
    })
  }
}

function error (req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.status(404).send({ mensaje: 'Página no encontrada' })
}

module.exports = {
  salesCustomer,
  salesProduct,
  error
}
