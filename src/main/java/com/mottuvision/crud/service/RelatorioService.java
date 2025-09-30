package com.mottuvision.crud.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mottuvision.crud.dto.RelatorioDTO;
import com.mottuvision.crud.dto.RelatorioDTO.TotalStatusDTO;
import com.mottuvision.crud.dto.RelatorioDTO.TotalStatusGrupoDTO;
import com.mottuvision.crud.dto.RelatorioDTO.ZonasDTO;
import com.mottuvision.crud.model.Moto;
import com.mottuvision.crud.model.Status;
import com.mottuvision.crud.model.StatusGrupo;
import com.mottuvision.crud.model.Zona;
import com.mottuvision.crud.repository.MotoRepository;
import com.mottuvision.crud.repository.PatioFinalizadasRepository;
import com.mottuvision.crud.repository.StatusGrupoRepository;
import com.mottuvision.crud.repository.StatusRepository;
import com.mottuvision.crud.repository.ZonaRepository;

@Service
public class RelatorioService {

    @Autowired
    private MotoRepository motoRepository;
    
    @Autowired
    private ZonaRepository zonaRepository;
    
    @Autowired
    private PatioFinalizadasRepository patioFinalizadasRepository;
    
    @Autowired
    private StatusGrupoRepository statusGrupoRepository;
    
    @Autowired
    private StatusRepository statusRepository;

    public RelatorioDTO gerarRelatorio() {
        // Buscar todas as motos ativas
        List<Moto> todasMotos = motoRepository.findAll();
        
        // Calcular totais gerais
        Long totalMotos = (long) todasMotos.size();
        Long totalFinalizadas = patioFinalizadasRepository.countTotal();
        
        // Gerar dados de totalStatusGrupo
        List<TotalStatusGrupoDTO> totalStatusGrupo = gerarTotalStatusGrupo(todasMotos);
        
        // Gerar total de todos os status
        List<TotalStatusDTO> totalStatus = gerarTotalStatus(todasMotos);
        
        // Gerar dados por zona
        List<ZonasDTO> zonas = gerarDadosPorZona(todasMotos);
        
        return new RelatorioDTO(totalMotos, totalFinalizadas, totalStatusGrupo, totalStatus, zonas);
    }
    
    private List<TotalStatusGrupoDTO> gerarTotalStatusGrupo(List<Moto> motos) {
        List<TotalStatusGrupoDTO> resultado = new ArrayList<>();
        List<StatusGrupo> todosStatusGrupos = statusGrupoRepository.findAll();
        
        for (StatusGrupo statusGrupo : todosStatusGrupos) {
            Long count = motos.stream()
                .filter(moto -> moto.getStatus() != null && 
                               moto.getStatus().getStatusGrupo() != null &&
                               moto.getStatus().getStatusGrupo().getId().equals(statusGrupo.getId()))
                .count();
                
            TotalStatusGrupoDTO dto = new TotalStatusGrupoDTO(
                statusGrupo.getId(),
                statusGrupo.getNome(),
                count
            );
            resultado.add(dto);
        }
        
        return resultado;
    }
    
    private List<TotalStatusDTO> gerarTotalStatus(List<Moto> motos) {
        List<TotalStatusDTO> resultado = new ArrayList<>();
        List<Status> todosStatus = statusRepository.findAll();
        
        for (Status status : todosStatus) {
            Long count = motos.stream()
                .filter(moto -> moto.getStatus() != null && 
                               moto.getStatus().getId().equals(status.getId()))
                .count();
                
            TotalStatusDTO dto = new TotalStatusDTO(
                status.getId(),
                status.getNome(),
                count,
                status.getStatusGrupo()
            );
            resultado.add(dto);
        }
        
        return resultado;
    }
    
    private List<ZonasDTO> gerarDadosPorZona(List<Moto> todasMotos) {
        List<ZonasDTO> dadosZonas = new ArrayList<>();
        
        // Agrupar motos por zona
        Map<Zona, List<Moto>> motosPorZona = todasMotos.stream()
                .filter(moto -> moto.getZona() != null)
                .collect(Collectors.groupingBy(Moto::getZona));
        
        // Buscar todas as zonas
        List<Zona> todasZonas = zonaRepository.findAll();
        
        for (Zona zona : todasZonas) {
            List<Moto> motosZona = motosPorZona.getOrDefault(zona, new ArrayList<>());
            
            // Gerar totalStatusGrupo para esta zona
            List<TotalStatusGrupoDTO> totalStatusGrupoZona = gerarTotalStatusGrupo(motosZona);
            
            // Gerar totalStatus para esta zona
            List<TotalStatusDTO> totalStatusZona = gerarTotalStatus(motosZona);
            
            ZonasDTO zonaDTO = new ZonasDTO(
                zona.getId().toString(),
                zona.getNome(),
                zona.getLetra(),
                (long) motosZona.size(),
                totalStatusGrupoZona,
                totalStatusZona
            );
            
            dadosZonas.add(zonaDTO);
        }
        
        // Ordenar por nome da zona
        dadosZonas.sort((a, b) -> a.getNome().compareTo(b.getNome()));
        
        return dadosZonas;
    }
}