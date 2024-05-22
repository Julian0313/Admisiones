CREATE DATABASE Admisiones;
GO

USE Admisiones;
GO

CREATE TABLE pais (
    idPais INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE estado (
    idEstado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE estadoAspirante (
    idEstadoAspirante INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE departamento (
    idDepartamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fkIdPais INT,
    fkIdEstado INT
);
CREATE INDEX idx_departamento_fkIdPais ON departamento (fkIdPais);
CREATE INDEX idx_departamento_fkIdEstado ON departamento (fkIdEstado);

CREATE TABLE ciudad (
    idCiudad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fkIdDepartamento INT,
    fkIdEstado INT
);
CREATE INDEX idx_ciudad_fkIdDepartamento ON ciudad (fkIdDepartamento);
CREATE INDEX idx_ciudad_fkIdEstado ON ciudad (fkIdEstado);

CREATE TABLE grupoSanguineo (
    idGrupoSanguineo INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE sede (
    idSede INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fkIdCiudad INT,
    fkIdEstado INT
);
CREATE INDEX idx_sede_fkIdCiudad ON sede (fkIdCiudad);
CREATE INDEX idx_sede_fkIdEstado ON sede (fkIdEstado);

CREATE TABLE modalidad (
    idModalidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE programaAcademico (
    idProgramaAcademico INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fkIdSede INT,
    fkIdModalidad INT,
    fkIdEstado INT
);
CREATE INDEX idx_programaAcademico_fkIdSede ON programaAcademico (fkIdSede);
CREATE INDEX idx_programaAcademico_fkIdModalidad ON programaAcademico (fkIdModalidad);
CREATE INDEX idx_programaAcademico_fkIdEstado ON programaAcademico (fkIdEstado);

CREATE TABLE sexo (
    idSexo INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE tipoDocumento (
    idTipoDocumento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    idPersona INT IDENTITY(1,1) PRIMARY KEY,    
    documento VARCHAR(10) NOT NULL,
    nombre1 VARCHAR(50) NOT NULL,
    nombre2 VARCHAR(50),
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    numeroTel VARCHAR(10),
    numeroCel VARCHAR(10),
    correo VARCHAR(50) NOT NULL,
	foto VARCHAR(50) NOT NULL
    fechaNacimiento DATE NOT NULL,	
    fechaExp DATE NOT NULL,
	fkIdTipoDocumento INT,
	fkPaisNaci INT,
    fkDepartamentoNaci INT,
    fkCiudadNaci INT,
    fkPaisExp INT,
    fkDepartamentoExp INT,
    fkCiudadExp INT,    
    fkIdSexo INT,	
);
CREATE INDEX idx_persona_fkIdTipoDocumento ON persona (fkIdTipoDocumento);
CREATE INDEX idx_persona_fkPaisNaci ON persona (fkPaisNaci);
CREATE INDEX idx_persona_fkDepartamentoNaci ON persona (fkDepartamentoNaci);
CREATE INDEX idx_persona_fkCiudadNaci ON persona (fkCiudadNaci);
CREATE INDEX idx_persona_fkPaisExp ON persona (fkPaisExp);
CREATE INDEX idx_persona_fkDepartamentoExp ON persona (fkDepartamentoExp);
CREATE INDEX idx_persona_fkCiudadExp ON persona (fkCiudadExp);
CREATE INDEX idx_persona_fkIdSexo ON persona (fkIdSexo);

CREATE TABLE tipoAspirante (
    idTipoAspirante INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE aspirante (
    idAspirante INT IDENTITY(1,1) PRIMARY KEY,
    fkIdPersona INT,
    fkIdTipoAspirante INT,
    fkIdEstadoAspirante INT
);
CREATE INDEX idx_aspirante_fkIdPersona ON aspirante (fkIdPersona);
CREATE INDEX idx_aspirante_fkIdTipoAspirante ON aspirante (fkIdTipoAspirante);
CREATE INDEX idx_aspirante_fkIdEstadoAspirante ON aspirante (fkIdEstadoAspirante);
