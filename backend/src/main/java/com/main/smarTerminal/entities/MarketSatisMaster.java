package com.main.smarTerminal.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@Entity
public class MarketSatisMaster {
    @Id
    @Column(name = "MarketSatisMasterID", nullable = false, precision = 18)
    private BigDecimal id;

    @Column(name = "MarketVardiyaID")
    private int marketVardiyaID;

    @Column(name = "Tarih")
    private Instant tarih;

    @Column(name = "Saat", length = 8)
    private String saat;

    @Column(name = "Sil")
    private Boolean sil;

    @Column(name = "NakitToplam")
    private Double nakitToplam;

    @Column(name = "PosToplam")
    private Double posToplam;

    @Column(name = "VeresiyeToplam")
    private Double veresiyeToplam;

    @Column(name = "IadeToplam")
    private Double iadeToplam;

    @Column(name = "Kur")
    private Double kur;

    @Column(name = "IndirimToplam")
    private Double indirimToplam;

    @Column(name = "YuvarlamaToplam")
    private Double yuvarlamaToplam;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ParaBirimKodID")
    private Kod paraBirimKodID;

    @Column(name = "SatisToplam")
    private Double satisToplam;

    @Column(name = "GiderToplam")
    private Double giderToplam;

    @Column(name = "RemoteIP")
    private Integer remoteIP;

    @Column(name = "YazarKasaID")
    private Integer yazarKasaID;

    @Column(name = "VeresiyeMasterID", precision = 18)
    private BigDecimal veresiyeMasterID;

    @ColumnDefault("0")
    @Column(name = "VardiyaDurum", nullable = false)
    private Boolean vardiyaDurum = false;

    @ColumnDefault("0")
    @Column(name = "DataDurum", nullable = false)
    private Boolean dataDurum = false;

    @Column(name = "GuncellemeTarihi")
    private Instant guncellemeTarihi;

    @Column(name = "GuncelleyenKullaniciID")
    private UUID guncelleyenKullaniciID;

    @Column(name = "YaratanKullaniciID")
    private UUID yaratanKullaniciID;

    @Column(name = "YaratilmaTarihi")
    private Instant yaratilmaTarihi;

    @Column(name = "FisNo", length = 50)
    private String fisNo;

    @Column(name = "FirmaID")
    private Integer firmaID;

    @Column(name = "SatisYapanPersonelID")
    private Integer satisYapanPersonelID;

    @Column(name = "MasaID")
    private Integer masaID;

    @Column(name = "AdisyonID")
    private Integer adisyonID;

    @Column(name = "MasaDurum")
    private Integer masaDurum;

    @Column(name = "RestoranGrupID")
    private Integer restoranGrupID;

    @Column(name = "MasaKategoriID")
    private Integer masaKategoriID;

    @Column(name = "RestoranMusteriSayisi")
    private Integer restoranMusteriSayisi;

    @Column(name = "NakitCariKartID")
    private Integer nakitCariKartID;

    @Column(name = "SiparisCariKartID")
    private Integer siparisCariKartID;

    @Column(name = "FisSiraNo")
    private Integer fisSiraNo;

    @Nationalized
    @Lob
    @Column(name = "EntegreTip")
    private String entegreTip;

    @Nationalized
    @Lob
    @Column(name = "EntegreSeri")
    private String entegreSeri;

    @Nationalized
    @Lob
    @Column(name = "EntegreNo")
    private String entegreNo;

    @Nationalized
    @Lob
    @Column(name = "EFaturaArsivGonderildimi")
    private String eFaturaArsivGonderildimi;

    @Column(name = "EFaturaveArsivCariID")
    private Integer eFaturaveArsivCariID;

    @Column(name = "EttnID")
    private UUID ettnID;

    @Column(name = "NetsisGonderildimi")
    private Integer netsisGonderildimi;

    @Nationalized
    @Lob
    @Column(name = "BilgisayarAdi")
    private String bilgisayarAdi;

    @Column(name = "OfflineVardiyaMasterID")
    private Integer offlineVardiyaMasterID;

    @Column(name = "OnlineSunucuyaGonderildimi")
    private Integer onlineSunucuyaGonderildimi;

}