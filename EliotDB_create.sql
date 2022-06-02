-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-02 00:13:27.324

-- tables
-- Table: CCTV
CREATE TABLE CCTV (
    idCCTV int NOT NULL AUTO_INCREMENT,
    aliasCCTV varchar(30) NOT NULL,
    direccionIPCCTV varchar(60) NOT NULL,
    estadoCCTV bool NOT NULL,
    Usuario_idUsuario int NOT NULL,
    UNIQUE INDEX IP_CCTV (direccionIPCCTV),
    CONSTRAINT CCTV_pk PRIMARY KEY (idCCTV)
);

-- Table: Camara
CREATE TABLE Camara (
    idCamara int NOT NULL AUTO_INCREMENT,
    direccionIPCamara varchar(60) NOT NULL,
    aliasCamara varchar(30) NOT NULL,
    codigoSNCamara varchar(30) NULL,
    marcaCamara varchar(30) NULL,
    modeloCamara varchar(30) NULL,
    estadoCamara bool NOT NULL,
    CCTV_idCCTV int NOT NULL,
    UNIQUE INDEX SN_Camara (codigoSNCamara),
    UNIQUE INDEX IP_Camara (direccionIPCamara),
    CONSTRAINT Camara_pk PRIMARY KEY (idCamara)
);

-- Table: Sensor
CREATE TABLE Sensor (
    idSensor int NOT NULL AUTO_INCREMENT,
    aliasSensor varchar(30) NOT NULL,
    direccionIPSensor varchar(60) NOT NULL,
    datosSensor varchar(60) NOT NULL,
    estadoSensor bool NOT NULL,
    CCTV_idCCTV int NOT NULL,
    UNIQUE INDEX IP_Sensor (direccionIPSensor),
    CONSTRAINT Sensor_pk PRIMARY KEY (idSensor)
);

-- Table: Switch
CREATE TABLE Switch (
    idSwitch int NOT NULL AUTO_INCREMENT,
    direccionIPSwitch varchar(60) NOT NULL,
    aliasSwitch varchar(30) NOT NULL,
    estadoSwitch bool NOT NULL,
    CCTV_idCCTV int NOT NULL,
    UNIQUE INDEX IP_Switch (direccionIPSwitch),
    CONSTRAINT Switch_pk PRIMARY KEY (idSwitch)
);

-- Table: Usuario
CREATE TABLE Usuario (
    idUsuario int NOT NULL AUTO_INCREMENT,
    nombresUsuario varchar(40) NOT NULL,
    apellidosUsuario varchar(40) NOT NULL,
    usernameUsuario varchar(20) NOT NULL,
    correoUsuario varchar(80) NOT NULL,
    passwordUsuario varchar(60) NOT NULL,
    estadoUsuario bool NOT NULL,
    tokenUsuario varchar(30) NOT NULL,
    tokenUsuarioEstado bool NOT NULL,
    UNIQUE INDEX username_Usuario (usernameUsuario),
    UNIQUE INDEX correo_Usuario (correoUsuario),
    CONSTRAINT Usuario_pk PRIMARY KEY (idUsuario)
);

-- foreign keys
-- Reference: CCTV_Usuario (table: CCTV)
ALTER TABLE CCTV ADD CONSTRAINT CCTV_Usuario FOREIGN KEY CCTV_Usuario (Usuario_idUsuario)
    REFERENCES Usuario (idUsuario);

-- Reference: Camara_CCTV (table: Camara)
ALTER TABLE Camara ADD CONSTRAINT Camara_CCTV FOREIGN KEY Camara_CCTV (CCTV_idCCTV)
    REFERENCES CCTV (idCCTV);

-- Reference: Sensor_CCTV (table: Sensor)
ALTER TABLE Sensor ADD CONSTRAINT Sensor_CCTV FOREIGN KEY Sensor_CCTV (CCTV_idCCTV)
    REFERENCES CCTV (idCCTV);

-- Reference: Switch_CCTV (table: Switch)
ALTER TABLE Switch ADD CONSTRAINT Switch_CCTV FOREIGN KEY Switch_CCTV (CCTV_idCCTV)
    REFERENCES CCTV (idCCTV);

-- End of file.

