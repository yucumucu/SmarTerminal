package com.main.smarTerminal.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@Entity
public class Grup {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "GrupID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ParentGrupID")
    private Grup parentGrupID;

    @ColumnDefault("0")
    @Column(name = "Sira")
    private Integer sira;

    @ColumnDefault("0")
    @Column(name = "Sil")
    private Boolean sil;

    @ManyToOne(fetch = FetchType.EAGER)
    @ColumnDefault("0")
    @JoinColumn(name = "FirmaID")
    private Organization firmaID;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "GrupCesitKodID", nullable = false)
    private Kod grupCesitKodID;

    @Nationalized
    @Column(name = "Ad", length = 250)
    private String ad;

    @Column(name = "YaratanKulaniciID")
    private Integer yaratanKulaniciID;

    @Column(name = "YaratilmaTarihi")
    private Instant yaratilmaTarihi;

    @Column(name = "GuncelleyanKullanciID")
    private UUID guncelleyanKullanciID;

    @Column(name = "GuncellemeTarihi")
    private Instant guncellemeTarihi;

    @ColumnDefault("0")
    @Column(name = "kar1")
    private Double kar1;

    @ColumnDefault("0")
    @Column(name = "kdv")
    private Double kdv;

    @ColumnDefault("''")
    @Column(name = "YKKIslemNo")
    private Integer yKKIslemNo;

    @ColumnDefault("0")
    @Column(name = "kar3")
    private Double kar3;

    @ColumnDefault("0")
    @Column(name = "kar4")
    private Double kar4;

    @Column(name = "MuhasebeGirisKod", length = 30)
    private String muhasebeGirisKod;

    @Column(name = "MuhasebeCikisKod", length = 30)
    private String muhasebeCikisKod;

    @Column(name = "MuhasebeAlisIadeKod", length = 30)
    private String muhasebeAlisIadeKod;

    @Column(name = "MuhasebeSatisIadeKod", length = 30)
    private String muhasebeSatisIadeKod;

    @Column(name = "MuhasebeAlisIskontoKod", length = 30)
    private String muhasebeAlisIskontoKod;

    @Column(name = "MuhasebeSatisIskontoKod", length = 30)
    private String muhasebeSatisIskontoKod;

    @Column(name = "MuhasebeAlisOTVKod", length = 30)
    private String muhasebeAlisOTVKod;

    @Column(name = "MuhasebeSatisOTVKod", length = 30)
    private String muhasebeSatisOTVKod;

    @Column(name = "MuhasebeSatisMalKod", length = 30)
    private String muhasebeSatisMalKod;

    @ColumnDefault("0")
    @Column(name = "DataDurum", nullable = false)
    private Boolean dataDurum = false;

    @Column(name = "KampanyaGrupID")
    private Integer kampanyaGrupID;

    @Nationalized
    @Lob
    @Column(name = "Yazici")
    private String yazici;

    @Column(name = "AlisFiyat")
    private Double alisFiyat;

    @Column(name = "SatisFiyat1")
    private Double satisFiyat1;

    @Column(name = "SatisFiyat2")
    private Double satisFiyat2;

    @Column(name = "SatisFiyat3")
    private Double satisFiyat3;

    @Column(name = "SatisFiyat4")
    private Double satisFiyat4;

}