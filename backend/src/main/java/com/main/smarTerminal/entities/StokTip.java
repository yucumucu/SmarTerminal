package com.main.smarTerminal.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

@Data
@Entity
@Table(name= "StokTip")
public class StokTip {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "StokTipID", nullable = false)
    private Integer id;

    @Column(name = "Kod", length = 10)
    private String kod;

    @Nationalized
    @Column(name = "AciklamaTr", length = 200)
    private String aciklamaTr;

    @Nationalized
    @Column(name = "AciklamaEn", length = 200)
    private String aciklamaEn;

    @Column(name = "OndalikHane")
    private Integer ondalikHane;

}