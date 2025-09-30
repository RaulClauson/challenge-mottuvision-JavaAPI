package com.mottuvision.crud.dto;

import java.util.List;

import com.mottuvision.crud.model.StatusGrupo;

public class RelatorioDTO {
    
    private Long totalMotos;
    private Long totalFinalizadas;
    private List<TotalStatusGrupoDTO> totalStatusGrupo;
    private List<TotalStatusDTO> totalStatus;
    private List<ZonasDTO> zonas;
    
    // Construtor padrão
    public RelatorioDTO() {}
    
    // Construtor com parâmetros
    public RelatorioDTO(Long totalMotos, Long totalFinalizadas, 
                       List<TotalStatusGrupoDTO> totalStatusGrupo, 
                       List<TotalStatusDTO> totalStatus,
                       List<ZonasDTO> zonas) {
        this.totalMotos = totalMotos;
        this.totalFinalizadas = totalFinalizadas;
        this.totalStatusGrupo = totalStatusGrupo;
        this.totalStatus = totalStatus;
        this.zonas = zonas;
    }

    // Getters e Setters
    public Long getTotalMotos() {
        return totalMotos;
    }

    public void setTotalMotos(Long totalMotos) {
        this.totalMotos = totalMotos;
    }

    public Long getTotalFinalizadas() {
        return totalFinalizadas;
    }

    public void setTotalFinalizadas(Long totalFinalizadas) {
        this.totalFinalizadas = totalFinalizadas;
    }

    public List<TotalStatusGrupoDTO> getTotalStatusGrupo() {
        return totalStatusGrupo;
    }

    public void setTotalStatusGrupo(List<TotalStatusGrupoDTO> totalStatusGrupo) {
        this.totalStatusGrupo = totalStatusGrupo;
    }

    public List<ZonasDTO> getZonas() {
        return zonas;
    }

    public void setZonas(List<ZonasDTO> zonas) {
        this.zonas = zonas;
    }

    public List<TotalStatusDTO> getTotalStatus() {
        return totalStatus;
    }

    public void setTotalStatus(List<TotalStatusDTO> totalStatus) {
        this.totalStatus = totalStatus;
    }
    
    // Classe para TotalStatusGrupo
    public static class TotalStatusGrupoDTO {
        private Long id;
        private String nome;
        private Long valor;
        
        // Construtor padrão
        public TotalStatusGrupoDTO() {}
        
        // Construtor com parâmetros
        public TotalStatusGrupoDTO(Long id, String nome, Long valor) {
            this.id = id;
            this.nome = nome;
            this.valor = valor;
        }
        
        // Getters e Setters
        public Long getId() {
            return id;
        }
        
        public void setId(Long id) {
            this.id = id;
        }
        
        public String getNome() {
            return nome;
        }
        
        public void setNome(String nome) {
            this.nome = nome;
        }
        
        public Long getValor() {
            return valor;
        }
        
        public void setValor(Long valor) {
            this.valor = valor;
        }
    }
    
    // Classe para TotalStatus
    public static class TotalStatusDTO {
        private Long id;
        private String nome;
        private Long valor;
        private StatusGrupo statusGrupo;
        
        // Construtor padrão
        public TotalStatusDTO() {}
        
        // Construtor com parâmetros
        public TotalStatusDTO(Long id, String nome, Long valor, StatusGrupo statusGrupo) {
            this.id = id;
            this.nome = nome;
            this.valor = valor;
            this.statusGrupo = statusGrupo;
        }
        
        // Getters e Setters
        public Long getId() {
            return id;
        }
        
        public void setId(Long id) {
            this.id = id;
        }
        
        public String getNome() {
            return nome;
        }
        
        public void setNome(String nome) {
            this.nome = nome;
        }
        
        public Long getValor() {
            return valor;
        }
        
        public void setValor(Long valor) {
            this.valor = valor;
        }
        
        public StatusGrupo getStatusGrupo() {
            return statusGrupo;
        }
        
        public void setStatusGrupo(StatusGrupo statusGrupo) {
            this.statusGrupo = statusGrupo;
        }
    }
    
    // Classe para Zonas
    public static class ZonasDTO {
        private String id;
        private String nome;
        private String letra;
        private Long totalMotos;
        private List<TotalStatusGrupoDTO> totalStatusGrupo;
        private List<TotalStatusDTO> totalStatus;
        
        // Construtor padrão
        public ZonasDTO() {}
        
        // Construtor com parâmetros
        public ZonasDTO(String id, String nome, String letra, Long totalMotos,
                       List<TotalStatusGrupoDTO> totalStatusGrupo, List<TotalStatusDTO> totalStatus) {
            this.id = id;
            this.nome = nome;
            this.letra = letra;
            this.totalMotos = totalMotos;
            this.totalStatusGrupo = totalStatusGrupo;
            this.totalStatus = totalStatus;
        }
        
        // Getters e Setters
        public String getId() {
            return id;
        }
        
        public void setId(String id) {
            this.id = id;
        }
        
        public String getNome() {
            return nome;
        }
        
        public void setNome(String nome) {
            this.nome = nome;
        }
        
        public String getLetra() {
            return letra;
        }
        
        public void setLetra(String letra) {
            this.letra = letra;
        }
        
        public Long getTotalMotos() {
            return totalMotos;
        }
        
        public void setTotalMotos(Long totalMotos) {
            this.totalMotos = totalMotos;
        }
        
        public List<TotalStatusGrupoDTO> getTotalStatusGrupo() {
            return totalStatusGrupo;
        }
        
        public void setTotalStatusGrupo(List<TotalStatusGrupoDTO> totalStatusGrupo) {
            this.totalStatusGrupo = totalStatusGrupo;
        }
        
        public List<TotalStatusDTO> getTotalStatus() {
            return totalStatus;
        }
        
        public void setTotalStatus(List<TotalStatusDTO> totalStatus) {
            this.totalStatus = totalStatus;
        }
    }
}