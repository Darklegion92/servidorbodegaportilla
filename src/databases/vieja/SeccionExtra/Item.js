import React, { useState } from "react";
import { useMediaQuery } from "react-responsive";
import { Typography } from "antd";
import { BANCO } from "../../config";

const { Text } = Typography;

function Item({ articulo, i, estrellas, agregarArticulo }) {
  const isTabletOrMobile = useMediaQuery({ maxWidth: 1224 });
  const isTabletOrMobileDevice = useMediaQuery({ maxDeviceWidth: 1224 });

  const [img, setImg] = useState(BANCO.URL + articulo.img);

  const onError = () => {
    setImg("img/articulodefecto.png");
  };
  return (
    <div
      className="item"
      style={
        isTabletOrMobile || isTabletOrMobileDevice
          ? articulo.categoria == "NUEVO"
            ? { width: "120px", height: "150px" }
            : { padding: "0", boxShadow: "none" }
          : articulo.categoria == "NUEVO"
          ? { width: "250px", height: "300px" }
          : { padding: "0", boxShadow: "none" }
      }
    >
      <div className="estrellas-item">
        {articulo.clasificacion > 0 && (
          <div
            className="estrellas-cantidad"
            style={
              articulo.categoria == "NUEVO"
                ? {
                    top: "-20px",
                    left: "0",
                    borderTopLeftRadius: "10px",
                  }
                : { top: "0", left: "0" }
            }
          >
            {estrellas(articulo.clasificacion)}
          </div>
        )}
        <img
          src={img}
          onError={onError}
          alt={articulo.codigo}
          width={
            isTabletOrMobile || isTabletOrMobileDevice
              ? articulo.categoria == "NUEVO"
                ? "100px!important"
                : "120px!important"
              : articulo.categoria == "NUEVO"
              ? "200px!important"
              : "350px!important"
          }
          id={i}
          onClick={agregarArticulo}
        />

        {articulo.categoria == "NUEVO" && <Text>{articulo.nombre}</Text>}
      </div>
    </div>
  );
}

export default Item;
