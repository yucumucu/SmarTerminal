package com.main.smarTerminal.entities;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.UUID;

@Getter
@Setter
@Entity


public class MarketVardiyaMaster {

    public double farkHesapla(){
        return -getSatisToplam()-getGelirToplam()+getIadeToplam()+getVeresiyeToplam()+getPosToplam()
                +getNaktestop()+getGiderToplam();
    }

    public String getTimeInterval(){
        return getSaat()+"-"+getKapanisSaat();
    }

    public String getDate(){
        LocalDate date = getTarih().atZone(ZoneId.systemDefault()).toLocalDate();
        return date.toString();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MarketVardiyaMasterID", nullable = false)
    private Integer id;

    @Column(name = "VardiyaID", nullable = false)
    private Integer vardiyaID;

    @Nationalized
    @Column(name = "Ad", length = 50)
    private String ad;

    @Column(name = "Sil")
    private Boolean sil;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "FirmaID")
    private Organization firmaID;

    @Column(name = "Tarih")
    private Instant tarih;

    @Column(name = "Saat", length = 8)
    private String saat;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PersonelKartID")
    private com.main.smarTerminal.entities.PersonelKart personelKartID;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "DepoKartID")
    private DepoKart depoKartID;

    @Column(name = "IadeToplam")
    private Double iadeToplam;

    @Column(name = "naktestop")
    private Double naktestop;

    @Column(name = "PosToplam")
    private Double posToplam;

    @Column(name = "VeresiyeToplam")
    private Double veresiyeToplam;

    @Column(name = "GiderToplam")
    private Double giderToplam;

    @Column(name = "TahsilatToplam")
    private Double tahsilatToplam;

    @Column(name = "OdemeToplam")
    private Double odemeToplam;

    @Column(name = "KapanisTarihi")
    private Instant kapanisTarihi;

    @Nationalized
    @Column(name = "KapanisSaat", length = 12)
    private String kapanisSaat;

    @Column(name = "YaratanKullaniciID")
    private UUID yaratanKullaniciID;

    @Column(name = "YaratilmaTarihi")
    private Instant yaratilmaTarihi;

    @Column(name = "GuncelleyenKullaniciID")
    private UUID guncelleyenKullaniciID;

    @Column(name = "GuncellemeTarihi")
    private Instant guncellemeTarihi;

    @Column(name = "SatisToplam")
    private Double satisToplam;

    @Column(name = "BozukPara")
    private Double bozukPara;

    @Column(name = "NakitSatisToplami")
    private Double nakitSatisToplami;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "VardiyaAcikFazlaTipKodID")
    private Kod vardiyaAcikFazlaTipKodID;

    @Column(name = "GelirToplam")
    private Double gelirToplam;

    @Column(name = "PosCariToplam")
    private Double posCariToplam;

    @Column(name = "Kur")
    private Double kur;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ParaBirimKodID")
    private Kod paraBirimKodID;

    @Column(name = "RemoteIP")
    private Integer remoteIP;

    @Column(name = "IndirimToplam")
    private Double indirimToplam;

    @Column(name = "YazarKasaNo")
    private Integer yazarKasaNo;

    @ColumnDefault("0")
    @Column(name = "VardiyaDurum", nullable = false)
    private Boolean vardiyaDurum = false;

    @ColumnDefault("0")
    @Column(name = "DataDurum", nullable = false)
    private Boolean dataDurum = false;

    @Column(name = "Mikro")
    private Boolean mikro;

    @Column(name = "KisiSayisi")
    private Integer kisiSayisi;

    @Column(name = "OfflineMarketVardiyaMasterID")
    private Integer offlineMarketVardiyaMasterID;

}