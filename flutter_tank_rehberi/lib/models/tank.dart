class Tank {
  String _tankAdi;
  String _tankTarihi;
  String _tankDetay;
  String _tankKucukResim;
  String _tankBuyukResim;

  Tank(this._tankAdi, this._tankTarihi, this._tankDetay, this._tankKucukResim,
      this._tankBuyukResim);

  String get tankBuyukResim => _tankBuyukResim;

  set tankBuyukResim(String value) {
    _tankBuyukResim = value;
  }

  String get tankKucukResim => _tankKucukResim;

  set tankKucukResim(String value) {
    _tankKucukResim = value;
  }

  String get tankDetay => _tankDetay;

  set tankDetay(String value) {
    _tankDetay = value;
  }

  String get tankTarihi => _tankTarihi;

  set tankTarihi(String value) {
    _tankTarihi = value;
  }

  String get tankAdi => _tankAdi;

  set tankAdi(String value) {
    _tankAdi = value;
  }
}