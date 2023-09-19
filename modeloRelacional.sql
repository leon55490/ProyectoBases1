-- Crear tabla Usuario (distinto a perfil)
CREATE TABLE Usuario (
    usuarioId INT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    fechaRegistro DATE
);

-- Crear tabla Mascotas (perfil)
CREATE TABLE Mascota (
    mascotaId INT PRIMARY KEY,
    nombre VARCHAR(255),
    especie VARCHAR(50),
    edad INT,
    propietarioId INT,
    FOREIGN KEY (propietarioId) REFERENCES Usuario(usuarioId)
);

-- Crear tabla Privacidad (usuario)
CREATE TABLE Privacidad (
    usuarioId INT PRIMARY KEY,
    configuracionPrivacidad VARCHAR(255),
    FOREIGN KEY (usuarioId) REFERENCES Usuario(usuarioId)
);

-- Crear tabla Pagina
CREATE TABLE Pagina (
    paginaId INT PRIMARY KEY,
    nombre VARCHAR(255),
    creadorId INT,
    FOREIGN KEY (creadorId) REFERENCES Usuario(usuarioId)
);

-- Crear tabla Evento
CREATE TABLE Evento (
    eventoId INT PRIMARY KEY,
    nombre VARCHAR(255),
    mascotaId INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla Grupo
CREATE TABLE Grupo (
    grupoId INT PRIMARY KEY,
    nombre VARCHAR(255),
    creadorId INT,
    FOREIGN KEY (creadorId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla Intereses
CREATE TABLE Interes (
    interesId INT PRIMARY KEY,
    mascotaId INT,
    interes VARCHAR(255),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla Amigos
CREATE TABLE Amigo (
    amigoId INT PRIMARY KEY,
    mascota1Id INT,
    mascota2Id INT,
    FOREIGN KEY (mascota1Id) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (mascota2Id) REFERENCES Mascota(mascotaId)
);

-- Crear tabla Mensajes
CREATE TABLE Mensaje (
    mensajeId INT PRIMARY KEY,
    remitenteId INT,
    receptorId INT,
    mensajeTexto TEXT,
    fechaEnvio DATE,
    FOREIGN KEY (remitenteId) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (receptorId) REFERENCES Mascota(mascotaId)
);


-- Crear tabla PublicacionMascota
CREATE TABLE PublicacionMascota (
    publicacionMascotaId INT PRIMARY KEY,
    mascotaId INT,
    contenido TEXT,
    fechaPublicacion DATE,
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla ReaccionPorPagina
CREATE TABLE ReaccionPorPagina (
    reaccionPaginaId INT PRIMARY KEY,
    paginaId INT,
    mascotaId INT,
    tipoReaccion VARCHAR(50),
    fechaReaccion DATE,
    FOREIGN KEY (paginaId) REFERENCES Pagina(paginaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla ReaccionPorMascota
CREATE TABLE ReaccionPorMascota (
    reaccionMascotaId INT PRIMARY KEY,
    publicacionMascotaId INT,
    mascotaId INT,
    tipoReaccion VARCHAR(50),
    fechaReaccion DATE,
    FOREIGN KEY (publicacionMascotaId) REFERENCES PublicacionMascota(publicacionMascotaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla ComentariosPagina
CREATE TABLE ComentarioPagina (
    comentarioPaginaId INT PRIMARY KEY,
    paginaId INT,
    mascotaId INT,
    contenido TEXT,
    fechaComentario DATE,
    FOREIGN KEY (paginaId) REFERENCES Pagina(paginaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla ComentariosMascota
CREATE TABLE ComentarioMascota (
    comentarioMascotaId INT PRIMARY KEY,
    publicacionMascotaId INT,
    mascotaId INT,
    contenido TEXT,
    fechaComentario DATE,
    FOREIGN KEY (publicacionMascotaId) REFERENCES PublicacionMascota(publicacionMascotaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla DenunciasPagina
CREATE TABLE DenunciaPagina (
    denunciaPaginaId INT PRIMARY KEY,
    paginaId INT,
    mascotaId INT,
    motivo TEXT,
    fechaDenuncia DATE,
    FOREIGN KEY (paginaId) REFERENCES Pagina(paginaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla DenunciasMascota
CREATE TABLE DenunciaMascota (
    denunciaMascotaId INT PRIMARY KEY,
    publicacionMascotaId INT,
    mascotaId INT,
    motivo TEXT,
    fechaDenuncia DATE,
    FOREIGN KEY (publicacionMascotaId) REFERENCES PublicacionMascota(publicacionMascotaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla SeguidoresPagina
CREATE TABLE SeguidorPagina (
    seguidorPaginaId INT PRIMARY KEY,
    paginaId INT,
    mascotaId INT,
    FOREIGN KEY (paginaId) REFERENCES Pagina(paginaId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);

-- Crear tabla SeguidoresMascota
CREATE TABLE SeguidorMascota (
    seguidorMascotaId INT PRIMARY KEY,
    mascotaIdSeguido INT,
    mascotaIdSeguidor INT,
    FOREIGN KEY (mascotaIdSeguido) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (mascotaIdSeguidor) REFERENCES Mascota(mascotaId)
);

-- Crear tabla MascotaGrupos (relación entre mascotas y grupos)
CREATE TABLE MascotaGrupo (
    mascotaId INT,
    grupoId INT,
    PRIMARY KEY (mascotaId, grupoId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (grupoId) REFERENCES Grupo(grupoId)
);
-- Crear tabla PublicacionPagina
CREATE TABLE PublicacionPagina (
    publicacionPaginaId INT PRIMARY KEY,
    paginaId INT,
    contenido TEXT,
    fechaPublicacion DATE,
    FOREIGN KEY (paginaId) REFERENCES Pagina(paginaId)
);

CREATE TABLE MensajePagina (
    mensajePaginaId INT PRIMARY KEY,
    paginaId INT,
    contenido TEXT,
    fechaEnvio DATE,
    FOREIGN KEY (paginaId) REFERENCES Pagina(paginaId)
);

CREATE TABLE MensajeMascota (
    mensajeMascotaId INT PRIMARY KEY,
    remitenteId INT,
    receptorId INT,
    contenido TEXT,
    fechaEnvio DATE,
    FOREIGN KEY (remitenteId) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (receptorId) REFERENCES Mascota(mascotaId)
);

CREATE TABLE MultimediaPagina (
    multimediaPaginaId INT PRIMARY KEY,
    publicacionPaginaId INT,
    url VARCHAR(255), -- Puedes modificar esto para almacenar la URL de la multimedia
    FOREIGN KEY (publicacionPaginaId) REFERENCES PublicacionPagina(publicacionPaginaId)
);

CREATE TABLE InteresPorMascota (
    interesPorMascotaId INT PRIMARY KEY,
    mascotaId INT,
    interesId INT,
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (interesId) REFERENCES Interes(interesId)
);

CREATE TABLE MultimediaMascota (
    multimediaMascotaId INT PRIMARY KEY,
    publicacionMascotaId INT,
    url VARCHAR(255), -- Puedes modificar esto para almacenar la URL de la multimedia
    FOREIGN KEY (publicacionMascotaId) REFERENCES PublicacionMascota(publicacionMascotaId)
);

CREATE TABLE PublicacionGrupo (
    publicacionGrupoId INT PRIMARY KEY,
    grupoId INT,
    contenido TEXT,
    fechaPublicacion DATE,
    FOREIGN KEY (grupoId) REFERENCES Grupo(grupoId)
);

CREATE TABLE MultimediaGrupo (
    multimediaGrupoId INT PRIMARY KEY,
    publicacionGrupoId INT,
    url VARCHAR(255), -- Puedes modificar esto para almacenar la URL de la multimedia
    FOREIGN KEY (publicacionGrupoId) REFERENCES PublicacionGrupo(publicacionGrupoId)
);

CREATE TABLE MensajeGrupo (
    mensajeGrupoId INT PRIMARY KEY,
    grupoId INT,
    contenido TEXT,
    fechaEnvio DATE,
    FOREIGN KEY (grupoId) REFERENCES Grupo(grupoId)
);

CREATE TABLE AsistenciaEvento (
    mascotaId INT,
    eventoId INT,
    PRIMARY KEY (mascotaId, eventoId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId),
    FOREIGN KEY (eventoId) REFERENCES Evento(eventoId)
);

CREATE TABLE DenunciaEvento (
    denunciaEventoId INT PRIMARY KEY,
    eventoId INT,
    mascotaId INT,
    motivo TEXT,
    fechaDenuncia DATE,
    FOREIGN KEY (eventoId) REFERENCES Evento(eventoId),
    FOREIGN KEY (mascotaId) REFERENCES Mascota(mascotaId)
);