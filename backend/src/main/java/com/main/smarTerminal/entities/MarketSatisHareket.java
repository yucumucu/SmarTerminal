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
public class MarketSatisHareket {
    @Id
    @Column(name = "MarketSatisHareketID", nullable = false, precision = 18)
    private BigDecimal id;

    @Column(name = "MarketSatisMasterID", nullable = false, precision = 12)
    private BigDecimal marketSatisMasterID;

    @Column(name = "Sil")
    private Boolean sil;

    @Column(name = "Tarih")
    private Instant tarih;

    @Nationalized
    @Column(name = "Saat", length = 12)
    private String saat;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "StokKartID")
    private com.main.smarTerminal.entities.StokKart stokKart;

    @Column(name = "Miktar")
    private Double miktar;

    @Column(name = "BirimFiyat")
    private Double birimFiyat;

    @Column(name = "YaratanKullaniciID")
    private UUID yaratanKullaniciID;

    @Column(name = "YaratilmaTarihi")
    private Instant yaratilmaTarihi;

    @Column(name = "GuncelleyenKullaniciID")
    private UUID guncelleyenKullaniciID;

    @Column(name = "KDVYuzde")
    private Double kDVYuzde;

    @Column(name = "GuncellemeTarihi")
    private Instant guncellemeTarihi;

    @Column(name = "KDVTipID")
    private Integer kDVTipID;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ParaBirimKodID")
    private Kod paraBirimKodID;

    @Column(name = "Kur")
    private Double kur;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "BirimKodID")
    private Kod birimKodID;

    @Nationalized
    @Column(name = "Barkod", length = 50)
    private String barkod;

    @Column(name = "SatisFiyatNo")
    private Boolean satisFiyatNo;

    @Column(name = "IndirimYuzdesi")
    private Double indirimYuzdesi;

    @Column(name = "GirisCikisTip", length = 1)
    private String girisCikisTip;

    @Nationalized
    @Column(name = "RemoteIP", length = 50)
    private String remoteIP;

    @ColumnDefault("0")
    @Column(name = "VardiyaDurum", nullable = false)
    private Boolean vardiyaDurum = false;

    @ColumnDefault("0")
    @Column(name = "DataDurum", nullable = false)
    private Boolean dataDurum = false;

    @Column(name = "MarketVardiyaID")
    private Integer marketVardiyaID;

    @Column(name = "StokRenkID")
    private Integer stokRenkID;

    @Column(name = "StokBedenNoID")
    private Integer stokBedenNoID;

    @Nationalized
    @Lob
    @Column(name = "StokEkOzellik")
    private String stokEkOzellik;

    @Column(name = "Cikti")
    private Integer cikti;

    @Column(name = "RestoranSatisiYapanPersonelKartID")
    private Integer restoranSatisiYapanPersonelKartID;

    @Column(name = "NakitToplam")
    private Double nakitToplam;

    @Column(name = "PosToplam")
    private Double posToplam;

    @Column(name = "VeresiyeToplam")
    private Double veresiyeToplam;

    @Column(name = "IadeToplam")
    private Double iadeToplam;

    @Column(name = "IndirimToplam")
    private Double indirimToplam;

    @Column(name = "SatisToplam")
    private Double satisToplam;

    @Column(name = "GiderToplam")
    private Double giderToplam;

    @Column(name = "NakitCariKartID")
    private Integer nakitCariKartID;

    @Column(name = "VeresiyeCariKartID")
    private Integer veresiyeCariKartID;

    @Column(name = "GelirGiderKartID")
    private Integer gelirGiderKartID;

    @Column(name = "IndirimGelirGiderKartID")
    private Integer indirimGelirGiderKartID;

    @Column(name = "PosKartID")
    private Integer posKartID;

    @Column(name = "VeresiyeCariTipID")
    private Integer veresiyeCariTipID;

    @Column(name = "VeresiyeMasterID")
    private Integer veresiyeMasterID;

    @Column(name = "IslemHareketTipID")
    private Integer islemHareketTipID;

    @Nationalized
    @Lob
    @Column(name = "IdirimAciklama")
    private String idirimAciklama;

    @Column(name = "OdemeTamamlandimi")
    private Integer odemeTamamlandimi;

    @Column(name = "YedekMiktar")
    private Double yedekMiktar;

    @Column(name = "KalanMiktar")
    private Double kalanMiktar;

    @Column(name = "OdenenMiktar")
    private Double odenenMiktar;

    @Column(name = "IkramYapildimi")
    private Integer ikramYapildimi;

    @Column(name = "CariKartID")
    private Integer cariKartID;

}