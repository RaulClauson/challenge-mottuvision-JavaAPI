package com.mottuvision.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mottuvision.crud.dto.EssenciaisDTO;
import com.mottuvision.crud.dto.RelatorioDTO;
import com.mottuvision.crud.model.Modelo;
import com.mottuvision.crud.model.Status;
import com.mottuvision.crud.model.StatusGrupo;
import com.mottuvision.crud.model.Zona;
import com.mottuvision.crud.repository.ModeloRepository;
import com.mottuvision.crud.repository.StatusGrupoRepository;
import com.mottuvision.crud.repository.StatusRepository;
import com.mottuvision.crud.repository.ZonaRepository;
import com.mottuvision.crud.service.RelatorioService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/essenciais")
@Tag(name = "Dados Essenciais", description = "Endpoint para buscar todos os dados essenciais em uma única requisição.")
public class EssenciaisController {

    private final ModeloRepository modeloRepository;
    private final StatusRepository statusRepository;
    private final StatusGrupoRepository statusGrupoRepository;
    private final ZonaRepository zonaRepository;

    @Autowired
    public EssenciaisController(
            ModeloRepository modeloRepository,
            StatusRepository statusRepository,
            StatusGrupoRepository statusGrupoRepository,
            ZonaRepository zonaRepository) {
        this.modeloRepository = modeloRepository;
        this.statusRepository = statusRepository;
        this.statusGrupoRepository = statusGrupoRepository;
        this.zonaRepository = zonaRepository;
    }

    @GetMapping
    @Operation(
            summary = "Busca todos os dados essenciais",
            description = "Retorna todos os dados essenciais (modelos, grupos de status, zonas e relatório) em uma única requisição."
    )
    public EssenciaisDTO getAllEssentials() {
        List<Modelo> modelos = modeloRepository.findAll();
        List<StatusGrupo> statusGrupos = statusGrupoRepository.findAll();
        List<Status> status = statusRepository.findAll();
        List<Zona> zonas = zonaRepository.findAll();
        return new EssenciaisDTO(modelos, statusGrupos, status, zonas);
    }
}
