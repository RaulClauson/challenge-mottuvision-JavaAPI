package com.mottuvision.crud.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mottuvision.crud.model.Zona;

@Repository
public interface ZonaRepository extends JpaRepository<Zona, Long> {
}

