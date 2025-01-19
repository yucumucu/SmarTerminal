package com.main.smarTerminal.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.UUID;

@Data
@Entity
public class Organization {
    @Id
    @Column(name = "OrganizationID", nullable = false)
    private Integer id;

    @Nationalized
    @Column(name = "Code", length = 10)
    private String code;

    @Nationalized
    @Column(name = "Name", length = 100)
    private String name;

    @Column(name = "UserID")
    private UUID userID;

    @Column(name = "CreationTime")
    private Instant creationTime;

    @Column(name = "LastUpdateUserID")
    private UUID lastUpdateUserID;

    @Column(name = "LastUpdateTime")
    private Instant lastUpdateTime;

    @Column(name = "IletisimID")
    private Integer iletisimID;

    @Column(name = "PVKasaID", precision = 18)
    private BigDecimal pVKasaID;

    @Column(name = "MVKasaID", precision = 18)
    private BigDecimal mVKasaID;

    @Column(name = "PVKapatGelirGiderID", precision = 18)
    private BigDecimal pVKapatGelirGiderID;

    @Column(name = "MVKapatGelirGiderID", precision = 18)
    private BigDecimal mVKapatGelirGiderID;

    @Column(name = "DagitimFirmaID")
    private Integer dagitimFirmaID;

    @Column(name = "FiyatKartaIsle")
    private Boolean fiyatKartaIsle;

    @Nationalized
    @Column(name = "EFaturaTuru", length = 50)
    private String eFaturaTuru;

    @Nationalized
    @Column(name = "EKullaniciKodu", length = 50)
    private String eKullaniciKodu;

    @Nationalized
    @Column(name = "EKullaniciSifresi", length = 50)
    private String eKullaniciSifresi;

    @Column(name = "EFaturaKesenCari")
    private Integer eFaturaKesenCari;

    @Nationalized
    @Column(name = "EFaturaSeri", length = 10)
    private String eFaturaSeri;

    @Nationalized
    @Column(name = "EFaturaNo", length = 10)
    private String eFaturaNo;

    @Nationalized
    @Column(name = "EFaturaYil", length = 4)
    private String eFaturaYil;

    @Column(name = "MDepoID")
    private Integer mDepoID;

    @Column(name = "MPersonelID")
    private Integer mPersonelID;

    @Column(name = "MGiderID")
    private Integer mGiderID;

    @Column(name = "MIndirimID")
    private Integer mIndirimID;

    @Column(name = "MPosID")
    private Integer mPosID;

    @Nationalized
    @Lob
    @Column(name = "Unvan")
    private String unvan;

    @Nationalized
    @Lob
    @Column(name = "Adres")
    private String adres;

    @Nationalized
    @Column(name = "Tel", length = 20)
    private String tel;

    @Nationalized
    @Column(name = "Fax", length = 20)
    private String fax;

    @Nationalized
    @Column(name = "MarketSatisEkran800600", length = 50)
    private String marketSatisEkran800600;

    @Nationalized
    @Column(name = "MarketSatisFiyat1Adi", length = 20)
    private String marketSatisFiyat1Adi;

    @Nationalized
    @Column(name = "MarketSatisFiyat2Adi", length = 20)
    private String marketSatisFiyat2Adi;

    @Nationalized
    @Column(name = "MarketSatisFiyat3Adi", length = 20)
    private String marketSatisFiyat3Adi;

    @Nationalized
    @Column(name = "MarketSatisFiyat4Adi", length = 20)
    private String marketSatisFiyat4Adi;

    @Column(name = "MarketStokKartOlusturmaTipID")
    private Integer marketStokKartOlusturmaTipID;

    @Column(name = "MSatisEkranAcilisSayisi")
    private Integer mSatisEkranAcilisSayisi;

    @Column(name = "RestontSatisEkran")
    private Integer restontSatisEkran;

    @Nationalized
    @Lob
    @Column(name = "VardiyaAdi")
    private String vardiyaAdi;

    @Nationalized
    @Lob
    @Column(name = "StokKartAdi")
    private String stokKartAdi;

    @Nationalized
    @Lob
    @Column(name = "SatisIadeEkranAdi")
    private String satisIadeEkranAdi;

    @Nationalized
    @Lob
    @Column(name = "MenuAdi")
    private String menuAdi;

    @Column(name = "YazarKasaBitisTarihi")
    private Instant yazarKasaBitisTarihi;

    @Column(name = "MarketSatisYuvarlaIndirimKartID")
    private Integer marketSatisYuvarlaIndirimKartID;

    @Column(name = "MarketSatisYuvarlaDurumID")
    private Integer marketSatisYuvarlaDurumID;

    @Column(name = "YuvarlamaYuzdeLimit")
    private Double yuvarlamaYuzdeLimit;

    @Column(name = "BulutSunucuYukle")
    private Integer bulutSunucuYukle;

    @Column(name = "BulutSunucuStokAcilisYardim")
    private Integer bulutSunucuStokAcilisYardim;

    @Nationalized
    @Lob
    @Column(name = "EFaturaYol")
    private String eFaturaYol;

    @Column(name = "EFatura")
    private Integer eFatura;

    @Column(name = "ResmiMuhasebe")
    private Integer resmiMuhasebe;

    @Column(name = "ResmiMuhasebeTip")
    private Integer resmiMuhasebeTip;

    @Nationalized
    @Lob
    @Column(name = "NetsisBaglanti")
    private String netsisBaglanti;

    @Nationalized
    @Lob
    @Column(name = "NetsisVeriTabaniAdi")
    private String netsisVeriTabaniAdi;

    @Nationalized
    @Lob
    @Column(name = "NetsisVeriTabaniKullaniciAdi")
    private String netsisVeriTabaniKullaniciAdi;

    @Nationalized
    @Lob
    @Column(name = "NetsisVeriTabaniSifre")
    private String netsisVeriTabaniSifre;

    @Nationalized
    @Lob
    @Column(name = "NetsisKullaiciAdi")
    private String netsisKullaiciAdi;

    @Nationalized
    @Lob
    @Column(name = "NetsisKullaiciSifre")
    private String netsisKullaiciSifre;

    @Nationalized
    @Lob
    @Column(name = "NetsisDeger")
    private String netsisDeger;

    @Column(name = "ADtipID")
    private Integer aDtipID;

    @Nationalized
    @Lob
    @Column(name = "ADad")
    private String aDad;

    @Nationalized
    @Lob
    @Column(name = "ADkullaniciAdi")
    private String aDkullaniciAdi;

    @Nationalized
    @Lob
    @Column(name = "ADsfire")
    private String aDsfire;

    @Nationalized
    @Lob
    @Column(name = "ADdomain")
    private String aDdomain;

    @Nationalized
    @Lob
    @Column(name = "ADdomainString")
    private String aDdomainString;

    @Column(name = "MHizliSatisPosID")
    private Integer mHizliSatisPosID;

    @Column(name = "RestoranMasaGenislik")
    private Integer restoranMasaGenislik;

    @Column(name = "RestoranMasaYukseklik")
    private Integer restoranMasaYukseklik;

    @Column(name = "MYeniStokKart1SatisKdvYuzde", precision = 18)
    private BigDecimal mYeniStokKart1SatisKdvYuzde;

    @Column(name = "MYeniStokKart2SatisKdvYuzde", precision = 18)
    private BigDecimal mYeniStokKart2SatisKdvYuzde;

    @Column(name = "MYeniStokKart3SatisKdvYuzde", precision = 18)
    private BigDecimal mYeniStokKart3SatisKdvYuzde;

    @Column(name = "MYeniStokKart4SatisKdvYuzde", precision = 18)
    private BigDecimal mYeniStokKart4SatisKdvYuzde;

    @Column(name = "MYeniStokKartAlisKdvYuzde", precision = 18)
    private BigDecimal mYeniStokKartAlisKdvYuzde;

    @Column(name = "MYeniStokKart1SatisKdvTipKodID")
    private Integer mYeniStokKart1SatisKdvTipKodID;

    @Column(name = "MYeniStokKart2SatisKdvTipKodID")
    private Integer mYeniStokKart2SatisKdvTipKodID;

    @Column(name = "MYeniStokKart3SatisKdvTipKodID")
    private Integer mYeniStokKart3SatisKdvTipKodID;

    @Column(name = "MYeniStokKart4SatisKdvTipKodID")
    private Integer mYeniStokKart4SatisKdvTipKodID;

    @Column(name = "MYeniStokKartAlisKdvTipKodID")
    private Integer mYeniStokKartAlisKdvTipKodID;

    @Column(name = "YKasaOtomatikCekmeceAc")
    private Integer yKasaOtomatikCekmeceAc;

    @Nationalized
    @Column(name = "MarketSatEkranArkaPlanRenk", length = 50)
    private String marketSatEkranArkaPlanRenk;

    @Nationalized
    @Column(name = "MarketSatEkranFontRenk", length = 50)
    private String marketSatEkranFontRenk;

    @Nationalized
    @Lob
    @Column(name = "in0")
    private String in0;

    @Nationalized
    @Lob
    @Column(name = "in1")
    private String in1;

    @Nationalized
    @Lob
    @Column(name = "in8")
    private String in8;

    @Nationalized
    @Lob
    @Column(name = "in18")
    private String in18;

    @Nationalized
    @Lob
    @Column(name = "Hes0")
    private String hes0;

    @Nationalized
    @Lob
    @Column(name = "Hes1")
    private String hes1;

    @Nationalized
    @Lob
    @Column(name = "Hes8")
    private String hes8;

    @Nationalized
    @Lob
    @Column(name = "Hes18")
    private String hes18;

    @Column(name = "HavuzCariID")
    private Integer havuzCariID;

    @Nationalized
    @Lob
    @Column(name = "MuhOnKod0")
    private String muhOnKod0;

    @Nationalized
    @Lob
    @Column(name = "MuhOnKod1")
    private String muhOnKod1;

    @Nationalized
    @Lob
    @Column(name = "MuhOnKod8")
    private String muhOnKod8;

    @Nationalized
    @Lob
    @Column(name = "MuhOnKod18")
    private String muhOnKod18;

    @Nationalized
    @Lob
    @Column(name = "MuhGrsKod0")
    private String muhGrsKod0;

    @Nationalized
    @Lob
    @Column(name = "MuhGrsKod1")
    private String muhGrsKod1;

    @Nationalized
    @Lob
    @Column(name = "MuhGrsKod8")
    private String muhGrsKod8;

    @Nationalized
    @Lob
    @Column(name = "MuhGrsKod18")
    private String muhGrsKod18;

    @Nationalized
    @Lob
    @Column(name = "MuhCksKod0")
    private String muhCksKod0;

    @Nationalized
    @Lob
    @Column(name = "MuhCksKod1")
    private String muhCksKod1;

    @Nationalized
    @Lob
    @Column(name = "MuhCksKod8")
    private String muhCksKod8;

    @Nationalized
    @Lob
    @Column(name = "MuhCksKod18")
    private String muhCksKod18;

    @Nationalized
    @Column(name = "MarketSatEkranArkaPlanRenk2", length = 50)
    private String marketSatEkranArkaPlanRenk2;

    @Column(name = "EFaturaCariUnvanTipID")
    private Integer eFaturaCariUnvanTipID;

    @Nationalized
    @Lob
    @Column(name = "MarketTransLstAna")
    private String marketTransLstAna;

    @Nationalized
    @Lob
    @Column(name = "MarketTransLstTabAdi")
    private String marketTransLstTabAdi;

    @Nationalized
    @Lob
    @Column(name = "MarketTransLstButon")
    private String marketTransLstButon;

    @Nationalized
    @Lob
    @Column(name = "\"MarketTransEkranBaslık\"")
    private String marketTransEkranBaslık;

    @Nationalized
    @Lob
    @Column(name = "MarketVardiyaTabAdi")
    private String marketVardiyaTabAdi;

    @Nationalized
    @Lob
    @Column(name = "MYeniStokKartBaslik")
    private String mYeniStokKartBaslik;

    @Nationalized
    @Lob
    @Column(name = "KzRaporStkTurAkaryakit")
    private String kzRaporStkTurAkaryakit;

    @Nationalized
    @Lob
    @Column(name = "KzRaporStkTurMarket")
    private String kzRaporStkTurMarket;

    @Nationalized
    @Lob
    @Column(name = "KzRaporStkTurGider")
    private String kzRaporStkTurGider;

    @Nationalized
    @Lob
    @Column(name = "KzRaporGridBaslikMarket")
    private String kzRaporGridBaslikMarket;

    @Nationalized
    @Lob
    @Column(name = "KzRaporGridBaslikAkaryakit")
    private String kzRaporGridBaslikAkaryakit;

    @Nationalized
    @Lob
    @Column(name = "KzRaporGridBaslikGider")
    private String kzRaporGridBaslikGider;

    @Column(name = "KzRaporAkaryakitGoster")
    private Integer kzRaporAkaryakitGoster;

    @Column(name = "MarketSatisEkranSonSatisGosterimAdet")
    private Integer marketSatisEkranSonSatisGosterimAdet;

    @Nationalized
    @Lob
    @Column(name = "EIrsaliyeYol")
    private String eIrsaliyeYol;

    @Nationalized
    @Lob
    @Column(name = "EIrsaliyeSeri")
    private String eIrsaliyeSeri;

    @Nationalized
    @Lob
    @Column(name = "NposDbIpAdress")
    private String nposDbIpAdress;

    @Nationalized
    @Lob
    @Column(name = "NposDbUsername")
    private String nposDbUsername;

    @Nationalized
    @Lob
    @Column(name = "NposDbPassword")
    private String nposDbPassword;

    @Nationalized
    @Lob
    @Column(name = "NposDbDataName")
    private String nposDbDataName;

    @Column(name = "YKasaBankaTanimlimi")
    private Integer yKasaBankaTanimlimi;

    @Column(name = "VDisiKasaID")
    private Integer vDisiKasaID;

    @Column(name = "ZraporCariID")
    private Integer zraporCariID;

    @Nationalized
    @Lob
    @Column(name = "NetsisIadeSeri")
    private String netsisIadeSeri;

    @Column(name = "NetsisIadeNumara")
    private Integer netsisIadeNumara;

    @Column(name = "VtsOtoFis")
    private Integer vtsOtoFis;

    @Column(name = "SadakatSistemi")
    private Integer sadakatSistemi;

    @Column(name = "SadakatYuzdeOrani")
    private Integer sadakatYuzdeOrani;

    @Column(name = "SadakatGiderKartID")
    private Integer sadakatGiderKartID;

    @Nationalized
    @Lob
    @Column(name = "WincorYkDosyaYolu")
    private String wincorYkDosyaYolu;

    @Column(name = "VtsLitreHane")
    private Integer vtsLitreHane;

    @Column(name = "NPOSSERVERCASHREGISTERID")
    private Integer nposservercashregısterıd;

    @Column(name = "NPOSCASHREGISTERNO")
    private Integer nposcashregısterno;

    @Nationalized
    @Lob
    @Column(name = "IBMGeniusDBIpAdres")
    private String iBMGeniusDBIpAdres;

    @Nationalized
    @Lob
    @Column(name = "IBMGeniusDBUserName")
    private String iBMGeniusDBUserName;

    @Nationalized
    @Lob
    @Column(name = "IBMGeniusDBPassword")
    private String iBMGeniusDBPassword;

    @Nationalized
    @Lob
    @Column(name = "IBMGeniusDBDataName")
    private String iBMGeniusDBDataName;

    @Nationalized
    @Lob
    @Column(name = "IBMGeniusStokKlasorYol")
    private String iBMGeniusStokKlasorYol;

}