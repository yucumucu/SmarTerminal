package com.main.smarTerminal.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.UUID;

@Data
@Entity
@Table
public class StokKart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "StokKartID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "StokTipID")
    private StokTip stokTipID;

    @Column(name = "Kod", nullable = false, length = 30)
    private String kod;

    @Column(name = "FirmaID")
    private Integer firmaID;

    //unused column
    @Column(name = "BarkodID", precision = 18)
    private BigDecimal barkodID;

    @Column(name = "Ad", length = 100)
    private String ad;

    @Column(name = "Satis1Fiyat")
    private Double satis1Fiyat;

    @Column(name = "Satis1Kdv")
    private Double satis1Kdv;

    @Column(name = "Satis1KdvTipKodID")
    private Integer satis1KdvTipKodID;

    @Column(name = "Satis2Fiyat")
    private Double satis2Fiyat;

    @Column(name = "Satis2Kdv")
    private Double satis2Kdv;

    @Column(name = "Satis2KdvTipKodID")
    private Integer satis2KdvTipKodID;

    @Column(name = "AlisFiyat")
    private Double alisFiyat;

    @Column(name = "AilsKdv")
    private Double ailsKdv;

    @Column(name = "AlisKdvTipKodID")
    private Integer alisKdvTipKodID;

    @Column(name = "Kesafet")
    private Double kesafet;

    @Column(name = "OlcuKodID")
    private Integer olcuKodID;

    @Column(name = "Otv")
    private Double otv;

    @Column(name = "EkSatisaIzinVerme")
    private Boolean ekSatisaIzinVerme;

    @Column(name = "MinimumMiktar")
    private Double minimumMiktar;

    @Column(name = "DurumAktif", nullable = false)
    private Boolean durumAktif = false;

    @Column(name = "muhgrskod", length = 30)
    private String muhgrskod;

    @Column(name = "muhckskod", length = 30)
    private String muhckskod;

    @Column(name = "BirimCarpan")
    private Double birimCarpan;

    @Column(name = "YazarKasaKartID")
    private Integer yazarKasaKartID;

    @JoinColumn(name = "GrupID")
    @ManyToOne(fetch = FetchType.EAGER)
    private Grup grup;

    @Column(name = "AlisMiktar")
    private Double alisMiktar;

    @Column(name = "SatisMiktar")
    private Double satisMiktar;

    @Column(name = "Sil", nullable = false)
    private Integer sil;

    @Column(name = "YaratanKullaniciID")
    private UUID yaratanKullaniciID;

    @Column(name = "YaratilmaTarihi")
    private Instant yaratilmaTarihi;

    @Column(name = "GuncelleyenKullaniciID")
    private UUID guncelleyenKullaniciID;

    @Column(name = "GuncellemeTarihi")
    private Instant guncellemeTarihi;

    @Column(name = "AcilisMiktar")
    private Double acilisMiktar;

    @Column(name = "KarOran1")
    private Double karOran1;

    @Column(name = "KarOran2")
    private Double karOran2;

    @Column(name = "GrupKdvOran")
    private Double grupKdvOran;

    @Column(name = "Satis1ParaBirimKodID")
    private Integer satis1ParaBirimKodID;

    @Column(name = "Satis2ParaBirimKodID")
    private Integer satis2ParaBirimKodID;

    @Column(name = "AlisParaBirimKodID")
    private Integer alisParaBirimKodID;

    @Column(name = "AlisKdvliToplamTutar")
    private Double alisKdvliToplamTutar;

    @Column(name = "SatisKdvliToplamTutar")
    private Double satisKdvliToplamTutar;

    @Column(name = "OrtalamaAlisFiyatKdvli")
    private Double ortalamaAlisFiyatKdvli;

    @Column(name = "Zrapor", columnDefinition = "tinyint")
    private Short zrapor;

    @Column(name = "NotAciklama", length = 8000)
    private String notAciklama;

    @Column(name = "BirimKodID")
    private Integer birimKodID;

    @Column(name = "AltBirim1KodID")
    private Integer altBirim1KodID;


    @Column(name = "Alt1Carpan")
    private Double alt1Carpan;


    @Column(name = "YazarKasaKisimNo")
    private Integer yazarKasaKisimNo;

    @ColumnDefault("0")
    @Column(name = "DataDurum", nullable = false)
    private Boolean dataDurum = false;

}