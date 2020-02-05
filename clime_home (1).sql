-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-02-2020 a las 18:17:40
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clime_home`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `BIT_CODIGO` int(7) NOT NULL,
  `USU_CODIGO` int(7) NOT NULL,
  `OBJ_CODIGO` int(7) NOT NULL,
  `BIT_ACCION` varchar(20) NOT NULL,
  `BIT_DESCRIPCION` varchar(100) NOT NULL,
  `BIT_FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `CAR_CODIGO` int(7) NOT NULL,
  `CAR_DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `CIT_CODIGO` int(7) NOT NULL,
  `PAC_CODIGO` int(7) NOT NULL,
  `CAR_CODGIO` int(7) NOT NULL,
  `TIP_CODIGO` int(7) NOT NULL,
  `CIT_FECHA_CREACION` date NOT NULL,
  `CIT_FECHA_ACTUALIZACION` date NOT NULL,
  `CIT_HORA` time NOT NULL,
  `CIT_ESTADO` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `COMP_CODIGO` int(7) NOT NULL,
  `PROV_CODIGO` int(7) NOT NULL,
  `COMP_FECHA` date NOT NULL,
  `COMP_ISV` float NOT NULL,
  `COMP_EXCENTO` int(2) NOT NULL,
  `COMP_DESCUENTO` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `DETC_CODIGO` int(7) NOT NULL,
  `COMP_CODIGO` int(7) NOT NULL,
  `PROD_CODIGO` int(7) NOT NULL,
  `DETC_PRECIO` float NOT NULL,
  `DECT_CANTIDAD` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `DETP_CODIGO` int(7) NOT NULL,
  `PROD_CODIGO` int(7) NOT NULL,
  `PED_CODIGO` int(7) NOT NULL,
  `DETP_CANTIDAD` int(10) NOT NULL,
  `DETP_DESCUENTO` float NOT NULL,
  `DETP_ISV` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `DETV_CODIGO` int(7) NOT NULL,
  `VEN_CODIGO` int(7) NOT NULL,
  `PROD_CODIGO` int(7) NOT NULL,
  `DETV_PRECIO` float NOT NULL,
  `DETV_CANTIDAD` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `EMP_CODIGO` int(7) NOT NULL,
  `CAR_CODIGO` int(7) NOT NULL,
  `EMP_NUMERO_IDENTIDAD` varchar(20) NOT NULL,
  `EMP_NOMBRES` varchar(45) NOT NULL,
  `EMP_APELLIDOS` varchar(45) NOT NULL,
  `EMP_FECHA_NACIMIENTO` date NOT NULL,
  `EMP_EDAD` int(3) NOT NULL,
  `EMP_TEL_FIJO` int(10) DEFAULT NULL,
  `EMP_CELULAR` int(10) DEFAULT NULL,
  `EMP_PROFESION` varchar(20) NOT NULL,
  `EMP_FECHA_CONTRATACION` date NOT NULL,
  `EMP_GENERO` varchar(1) NOT NULL,
  `EMP_CORREO` varchar(35) NOT NULL,
  `EMP_DIRECCION` varchar(80) NOT NULL,
  `EMP_NACIONALIDAD` int(20) NOT NULL,
  `EMP_RTN` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `EXP_CODIGO` int(7) NOT NULL,
  `NUTRI_CODIGO` int(7) NOT NULL,
  `PAC_CODIGO` int(7) NOT NULL,
  `CAR_CODIGO` int(7) NOT NULL,
  `TIP_CODIGO` int(7) NOT NULL,
  `EXP_FECHA_CREACION` date NOT NULL,
  `EXP_FECHA_ACTUALIZACION` date NOT NULL,
  `EXP_ANTECEDENTES_CLINICOS` varchar(75) NOT NULL,
  `EXP_MEDICACION_PREVIA` varchar(75) NOT NULL,
  `EXP_TIPO_SANGRE` varchar(4) NOT NULL,
  `EXP_RECOMENDACION` varchar(50) NOT NULL,
  `EXP_FOTO_IRIS` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_nutricionista`
--

CREATE TABLE `expediente_nutricionista` (
  `NUTRI_CODIGO` int(7) NOT NULL,
  `PAC_CODIGO` int(7) NOT NULL,
  `CAR_CODIGO` int(7) NOT NULL,
  `NUTRI_FECHA_CREACION` date NOT NULL,
  `NUTRI_FECHA_ACTUALIZACION` date NOT NULL,
  `NUTRI_ANTECEDENTES_CLINICOS` varchar(80) NOT NULL,
  `NUTRI_MEDICACION_PREVIA` varchar(80) NOT NULL,
  `NUTRI_PESO` float NOT NULL,
  `NUTRI_ALTURA` float NOT NULL,
  `NUTRI_PRESION_ARTERIAL` float NOT NULL,
  `NUTRI_TEMPERATURA` float NOT NULL,
  `NUTRI_ALERGIA` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_password`
--

CREATE TABLE `historial_password` (
  `HISC_CODIGO` int(7) NOT NULL,
  `USU_CODIGO` int(7) NOT NULL,
  `HISC_CONTRASEÑA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `MOV_CODIGO` int(7) NOT NULL,
  `DETV_CODIGO` int(7) NOT NULL,
  `DETC_CODIGO` int(7) NOT NULL,
  `PROD_CODIGO` int(7) NOT NULL,
  `MOV_EXISTENCIA` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE `objetos` (
  `OBJ_CODIGO` int(7) NOT NULL,
  `OBJ_NOMBRE` varchar(100) NOT NULL,
  `OBJ_DESCRIPCION` varchar(100) NOT NULL,
  `OBJ_TIPO` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `PAC_CODIGO` int(7) NOT NULL,
  `PAC_NUMERO_IDENTIDAD` varchar(20) NOT NULL,
  `PAC_PASAPORTE` varchar(20) NOT NULL,
  `PAC_NOMNRE` varchar(45) NOT NULL,
  `PAC_APELLIDO` varchar(45) NOT NULL,
  `PAC_FECHA_NACIMIENTO` date NOT NULL,
  `PAC_EDAD` int(3) NOT NULL,
  `PAC_GENERO` varchar(1) NOT NULL,
  `PAC_TEL_FIJO` int(10) DEFAULT NULL,
  `PAC_CELULAR` int(10) DEFAULT NULL,
  `PAC_PROFESION` varchar(20) NOT NULL,
  `PAC_DIRECCION` varchar(45) NOT NULL,
  `PAC_CORREO` varchar(35) DEFAULT NULL,
  `PAC_RTN` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `PARMT_CODIGO` int(7) NOT NULL,
  `USU_CODIGO` int(7) NOT NULL,
  `PARMT_NOMBRE` varchar(50) NOT NULL,
  `PARMT_VALOR` varchar(100) NOT NULL,
  `PARMT_FECHA_CREACION` date NOT NULL,
  `PARMT_FECHA_MODIFICACION` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_institucionales`
--

CREATE TABLE `parametros_institucionales` (
  `PAR_CODIGO` int(7) NOT NULL,
  `PAR_NOMBRE_EMPRESA` varchar(45) NOT NULL,
  `PAR_DESCRIPCION_EMPRESA` varchar(80) NOT NULL,
  `PAR_DIRECCION` varchar(100) NOT NULL,
  `PAR_CORREO` varchar(35) NOT NULL,
  `PAR_TELEFONO` int(10) NOT NULL,
  `PAR_RTN` int(20) NOT NULL,
  `PAR_CAI` varchar(20) NOT NULL,
  `PAR_FECHA_FACT_INICIAL` date NOT NULL,
  `PAR_FECHA_FACT_FINAL` date NOT NULL,
  `PAR_NUMERO_FACT_INICIAL` int(10) NOT NULL,
  `PAR_NUMERO_FACT_FINAL` int(10) NOT NULL,
  `PAR_ULTIMO_NUMERO_FACT` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `PED_CODIGO` int(7) NOT NULL,
  `PED_FECHA_PEDIDO` date NOT NULL,
  `PED_FECHA_ENTREGA` date NOT NULL,
  `PED_ESTADO` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `ROL_CODIGO` int(7) NOT NULL,
  `OBJETO_CODIGO` int(7) NOT NULL,
  `PERMISO_INSERTAR` varchar(1) NOT NULL,
  `PERMISO_ELIMINAR` varchar(1) NOT NULL,
  `PERMISO_ACTUALIZAR` varchar(1) NOT NULL,
  `PERMISO_CONSULTAR` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `PRE_CODIGO` int(7) NOT NULL,
  `PRE_NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_usuarios`
--

CREATE TABLE `preguntas_usuarios` (
  `PRE_CODIGO` int(7) NOT NULL,
  `USU_CODIGO` int(7) NOT NULL,
  `PRU_RESPUESTA` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `PROD_CODIGO` int(7) NOT NULL,
  `PROV_CODIGO` int(7) NOT NULL,
  `PROD_NOMBRE` varchar(45) NOT NULL,
  `PROD_DESCRIPCION` varchar(80) NOT NULL,
  `PROD_FECHA_VENCIMIENTO` date NOT NULL,
  `PROD_PRECIO_POR_MAYOR` float NOT NULL,
  `PROD_PRECIO_COSTO` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `PROV_CODIGO` int(7) NOT NULL,
  `PROV_NOMBRE` varchar(45) NOT NULL,
  `PROV_CONTACTO` varchar(45) NOT NULL,
  `PROV_TELEFONO_CONTACTO` int(10) NOT NULL,
  `PROV_DIRECCION` varchar(80) NOT NULL,
  `PROV_CORREO` int(35) NOT NULL,
  `PROV_TELEFONO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ROL_CODIGO` int(7) NOT NULL,
  `ROL_NOMBRE` varchar(30) NOT NULL,
  `ROL_DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_citas`
--

CREATE TABLE `tipo_citas` (
  `TIP_CODIGO` int(7) NOT NULL,
  `TIP_CORRELATIVO` varchar(15) NOT NULL,
  `TIP_DESCRIPCION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `USU_CODIGO` int(7) NOT NULL,
  `ROL_CODIGO` int(7) NOT NULL,
  `USU_NOMBRES` varchar(50) NOT NULL,
  `USU_APELLIDOS` varchar(50) NOT NULL,
  `USU_PASSWORD` varchar(255) NOT NULL,
  `USU_ESTADO` varchar(100) NOT NULL,
  `USU_FECHA_ULTIMA_CONEXION` date NOT NULL,
  `USU_PREGUNTAS_CONTESTADAS` int(11) NOT NULL,
  `USU_PRIMER_INGRESO` int(11) NOT NULL,
  `USU_FECHA_VENCIMIENTO` date NOT NULL,
  `USU_CORREO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VEN_CODIGO` int(7) NOT NULL,
  `VEN_FECHA` date NOT NULL,
  `VEN_ISV` float NOT NULL,
  `VEN_EXCENTO` int(2) NOT NULL,
  `VEN_DESCUENTO` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`BIT_CODIGO`),
  ADD UNIQUE KEY `USU_CODIGO` (`USU_CODIGO`,`OBJ_CODIGO`),
  ADD KEY `OBJ_CODIGO` (`OBJ_CODIGO`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`CAR_CODIGO`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CIT_CODIGO`),
  ADD KEY `PAC_CODIGO` (`PAC_CODIGO`),
  ADD KEY `TIP_CODIGO` (`TIP_CODIGO`,`CAR_CODGIO`),
  ADD KEY `CAR_CODGIO` (`CAR_CODGIO`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`COMP_CODIGO`),
  ADD KEY `PROV_CODIGO` (`PROV_CODIGO`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`DETC_CODIGO`),
  ADD KEY `COMP_CODIGO` (`COMP_CODIGO`,`PROD_CODIGO`),
  ADD KEY `PROD_CODIGO` (`PROD_CODIGO`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`DETP_CODIGO`),
  ADD KEY `PROD_CODIGO` (`PROD_CODIGO`,`PED_CODIGO`),
  ADD KEY `PED_CODIGO` (`PED_CODIGO`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`DETV_CODIGO`),
  ADD KEY `VEN_CODIGO` (`VEN_CODIGO`,`PROD_CODIGO`),
  ADD KEY `PROD_CODIGO` (`PROD_CODIGO`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`EMP_CODIGO`),
  ADD KEY `CAR_CODIGO` (`CAR_CODIGO`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`EXP_CODIGO`),
  ADD KEY `PAC_CODIGO` (`PAC_CODIGO`,`CAR_CODIGO`,`TIP_CODIGO`),
  ADD KEY `CAR_CODIGO` (`CAR_CODIGO`),
  ADD KEY `TIP_CODIGO` (`TIP_CODIGO`),
  ADD KEY `NUTRI_CODIGO` (`NUTRI_CODIGO`);

--
-- Indices de la tabla `expediente_nutricionista`
--
ALTER TABLE `expediente_nutricionista`
  ADD PRIMARY KEY (`NUTRI_CODIGO`),
  ADD KEY `PAC_CODIGO` (`PAC_CODIGO`,`CAR_CODIGO`),
  ADD KEY `CAR_CODIGO` (`CAR_CODIGO`);

--
-- Indices de la tabla `historial_password`
--
ALTER TABLE `historial_password`
  ADD PRIMARY KEY (`HISC_CODIGO`),
  ADD UNIQUE KEY `USU_CODIGO` (`USU_CODIGO`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`MOV_CODIGO`),
  ADD KEY `PROD_CODIGO` (`PROD_CODIGO`),
  ADD KEY `movimientos_inventario_ibfk_2` (`DETC_CODIGO`),
  ADD KEY `DETV_CODIGO` (`DETV_CODIGO`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`OBJ_CODIGO`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`PAC_CODIGO`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`PARMT_CODIGO`),
  ADD UNIQUE KEY `USU_CODIGO` (`USU_CODIGO`),
  ADD UNIQUE KEY `USU_CODIGO_2` (`USU_CODIGO`);

--
-- Indices de la tabla `parametros_institucionales`
--
ALTER TABLE `parametros_institucionales`
  ADD PRIMARY KEY (`PAR_CODIGO`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`PED_CODIGO`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD UNIQUE KEY `ROL_CODIGO` (`ROL_CODIGO`),
  ADD UNIQUE KEY `OBJETO_CODIGO` (`OBJETO_CODIGO`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`PRE_CODIGO`);

--
-- Indices de la tabla `preguntas_usuarios`
--
ALTER TABLE `preguntas_usuarios`
  ADD UNIQUE KEY `PRE_CODIGO` (`PRE_CODIGO`,`USU_CODIGO`),
  ADD KEY `USU_CODIGO` (`USU_CODIGO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`PROD_CODIGO`),
  ADD KEY `PROV_CODIGO` (`PROV_CODIGO`),
  ADD KEY `PROV_CODIGO_2` (`PROV_CODIGO`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`PROV_CODIGO`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ROL_CODIGO`);

--
-- Indices de la tabla `tipo_citas`
--
ALTER TABLE `tipo_citas`
  ADD PRIMARY KEY (`TIP_CODIGO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`USU_CODIGO`),
  ADD KEY `ROL_CODIGO` (`ROL_CODIGO`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VEN_CODIGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `BIT_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `CAR_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `COMP_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `DETC_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `DETP_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `DETV_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `EMP_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `EXP_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente_nutricionista`
--
ALTER TABLE `expediente_nutricionista`
  MODIFY `NUTRI_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_password`
--
ALTER TABLE `historial_password`
  MODIFY `HISC_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `MOV_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `OBJ_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `PAC_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `PARMT_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros_institucionales`
--
ALTER TABLE `parametros_institucionales`
  MODIFY `PAR_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PED_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `PRE_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `PROD_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `PROV_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ROL_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_citas`
--
ALTER TABLE `tipo_citas`
  MODIFY `TIP_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USU_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VEN_CODIGO` int(7) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`USU_CODIGO`) REFERENCES `usuario` (`USU_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`OBJ_CODIGO`) REFERENCES `objetos` (`OBJ_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`TIP_CODIGO`) REFERENCES `tipo_citas` (`TIP_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`CAR_CODGIO`) REFERENCES `cargo` (`CAR_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`PAC_CODIGO`) REFERENCES `pacientes` (`PAC_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`PROV_CODIGO`) REFERENCES `proveedores` (`PROV_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`PROD_CODIGO`) REFERENCES `productos` (`PROD_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`COMP_CODIGO`) REFERENCES `compras` (`COMP_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`PROD_CODIGO`) REFERENCES `productos` (`PROD_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`PED_CODIGO`) REFERENCES `pedidos` (`PED_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`PROD_CODIGO`) REFERENCES `productos` (`PROD_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`VEN_CODIGO`) REFERENCES `ventas` (`VEN_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`CAR_CODIGO`) REFERENCES `cargo` (`CAR_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`PAC_CODIGO`) REFERENCES `pacientes` (`PAC_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_ibfk_2` FOREIGN KEY (`CAR_CODIGO`) REFERENCES `cargo` (`CAR_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_ibfk_3` FOREIGN KEY (`TIP_CODIGO`) REFERENCES `tipo_citas` (`TIP_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_ibfk_4` FOREIGN KEY (`NUTRI_CODIGO`) REFERENCES `expediente_nutricionista` (`NUTRI_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `expediente_nutricionista`
--
ALTER TABLE `expediente_nutricionista`
  ADD CONSTRAINT `expediente_nutricionista_ibfk_1` FOREIGN KEY (`CAR_CODIGO`) REFERENCES `cargo` (`CAR_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_password`
--
ALTER TABLE `historial_password`
  ADD CONSTRAINT `historial_password_ibfk_1` FOREIGN KEY (`USU_CODIGO`) REFERENCES `usuario` (`USU_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD CONSTRAINT `movimientos_inventario_ibfk_1` FOREIGN KEY (`PROD_CODIGO`) REFERENCES `productos` (`PROD_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_inventario_ibfk_2` FOREIGN KEY (`DETC_CODIGO`) REFERENCES `detalle_compra` (`DETC_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_inventario_ibfk_3` FOREIGN KEY (`DETV_CODIGO`) REFERENCES `detalle_venta` (`DETV_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`PAC_CODIGO`) REFERENCES `expediente_nutricionista` (`PAC_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`OBJETO_CODIGO`) REFERENCES `objetos` (`OBJ_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_3` FOREIGN KEY (`ROL_CODIGO`) REFERENCES `rol` (`ROL_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas_usuarios`
--
ALTER TABLE `preguntas_usuarios`
  ADD CONSTRAINT `preguntas_usuarios_ibfk_1` FOREIGN KEY (`USU_CODIGO`) REFERENCES `usuario` (`USU_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preguntas_usuarios_ibfk_2` FOREIGN KEY (`PRE_CODIGO`) REFERENCES `preguntas` (`PRE_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`PROV_CODIGO`) REFERENCES `proveedores` (`PROV_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ROL_CODIGO`) REFERENCES `rol` (`ROL_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`USU_CODIGO`) REFERENCES `parametros` (`USU_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
