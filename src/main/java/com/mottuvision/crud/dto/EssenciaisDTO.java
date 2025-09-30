package com.mottuvision.crud.dto;

import java.util.List;

import com.mottuvision.crud.model.Modelo;
import com.mottuvision.crud.model.Status;
import com.mottuvision.crud.model.StatusGrupo;
import com.mottuvision.crud.model.Zona;

public record EssenciaisDTO(
    List<Modelo> modelos,
    List<StatusGrupo> statusGrupos,
    List<Status> status,
    List<Zona> zonas
) {}
