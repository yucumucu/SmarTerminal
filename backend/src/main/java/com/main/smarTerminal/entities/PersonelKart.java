package com.main.smarTerminal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@Entity
public class PersonelKart {
    @Id
    @Column(name = "PersonelKartID", nullable = false)
    private Integer id;

    @Column(name = "PersonelDurumKodID")
    private Integer personelDurumKodID;

    @Column(name = "Sil")
    private Boolean sil;

    @Column(name = "FirmaID")
    private Integer firmaID;

    @Nationalized
    @Column(name = "Kod", nullable = false, length = 50)
    private String kod;

    @Column(name = "Ad", length = 100)
    private String ad;

    @Column(name = "Soyad", length = 100)
    private String soyad;

    @Column(name = "GrupID")
    private Integer grupID;

    @Column(name = "Tel", length = 30)
    private String tel;

    @Column(name = "Fax", length = 30)
    private String fax;

    @Column(name = "CepTel", length = 30)
    private String cepTel;

    @Column(name = "MuhasebeKod", length = 30)
    private String muhasebeKod;

    @Column(name = "AdresID")
    private Integer adresID;

    @Column(name = "VergiDaire", length = 30)
    private String vergiDaire;

    @Nationalized
    @Column(name = "VergiNo", length = 50)
    private String vergiNo;

    @Nationalized
    @Column(name = "Email", length = 100)
    private String email;

    @Nationalized
    @Column(name = "TCKimlikNo", length = 20)
    private String tCKimlikNo;

    @Column(name = "ToplamLimit")
    private Double toplamLimit;

    @Column(name = "MaasGun")
    private Integer maasGun;

    @Column(name = "Maas")
    private Double maas;

    @Column(name = "Prim")
    private Double prim;

    @Column(name = "Iskonto")
    private Double iskonto;

    @Column(name = "IsBasiTarihi")
    private Instant isBasiTarihi;

    @Column(name = "IsBitisTarihi")
    private Instant isBitisTarihi;

    @Column(name = "FisBakiye")
    private Double fisBakiye;

    @Column(name = "CariBakiye")
    private Double cariBakiye;

    @ColumnDefault("1")
    @Column(name = "Goster", nullable = false)
    private Boolean goster = false;

    @Column(name = "YaratanKullaniciID")
    private UUID yaratanKullaniciID;

    @Column(name = "YaratilmaTarihi")
    private Instant yaratilmaTarihi;

    @Column(name = "GuncelleyenKullaniciID")
    private UUID guncelleyenKullaniciID;

    @Column(name = "GuncellemeTarihi")
    private Instant guncellemeTarihi;

    @Column(name = "FisAdet")
    private Integer fisAdet;

    @Column(name = "FisAkaryakitTutari")
    private Double fisAkaryakitTutari;

    @Column(name = "FisAkaryakitAdet")
    private Integer fisAkaryakitAdet;

    @Column(name = "ParaBirimKodID")
    private Integer paraBirimKodID;

    @Column(name = "AcilisTutar")
    private Double acilisTutar;

    @Column(name = "MuhOnKod", length = 50)
    private String muhOnKod;

    @Column(name = "SGKNo", length = 50)
    private String sGKNo;

    @Column(name = "LimitTipID")
    private Integer limitTipID;

    @Column(name = "ResimID")
    private Integer resimID;

    @Nationalized
    @Column(name = "BankaAdi", length = 250)
    private String bankaAdi;

    @Nationalized
    @Column(name = "BankaSubesi", length = 250)
    private String bankaSubesi;

    @Nationalized
    @Column(name = "BankaHesapNo", length = 250)
    private String bankaHesapNo;

    @ColumnDefault("0")
    @Column(name = "DataDurum", nullable = false)
    private Boolean dataDurum = false;

    @Column(name = "Fotograf")
    private byte[] fotograf;

    @Nationalized
    @Column(name = "PersonelSifre", length = 50)
    private String personelSifre;

    @Column(name = "Agi")
    private Double agi;

    @Column(name = "Yemek")
    private Double yemek;

    @Column(name = "Yol")
    private Double yol;

    @Column(name = "ToplamMaas")
    private Double toplamMaas;

    @Column(name = "Bes")
    private Double bes;

    @Column(name = "IcraKesintisi")
    private Double icraKesintisi;

}