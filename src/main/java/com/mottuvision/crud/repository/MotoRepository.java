package com.mottuvision.crud.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mottuvision.crud.model.Moto;

@Repository
public interface MotoRepository extends JpaRepository<Moto, Long> {
    @Query("SELECT m FROM Moto m WHERE m.identificador.valor = :valor")
    Optional<Moto> findByIdentificadorValor(@Param("valor") String valor);
}
