package com.main.smarTerminal.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@Entity
public class Kod {
    @Id
    @Column(name = "KodID", nullable = false)
    private Integer id;

    @Column(name = "\"No\"")
    private Integer no;

    @Lob
    @Column(name = "Aciklama")
    private String aciklama;

    @Column(name = "Gizli")
    private Boolean gizli;

    @Nationalized
    @Column(name = "Kod", length = 50)
    private String kod;

}