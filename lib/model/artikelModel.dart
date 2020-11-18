class ArtikelModel {
  // ignore: non_constant_identifier_names
  final String id_atk;
  // ignore: non_constant_identifier_names
  final String atk_judul;
  // ignore: non_constant_identifier_names
  final String atk_isi;
  // ignore: non_constant_identifier_names
  final String atk_foto;
  // ignore: non_constant_identifier_names
  final String atk_file;
  final String jenis;
  final String tanggal;

  ArtikelModel(
      // ignore: non_constant_identifier_names
      {this.id_atk,
      // ignore: non_constant_identifier_names
      this.atk_judul,
      // ignore: non_constant_identifier_names
      this.atk_isi,
      // ignore: non_constant_identifier_names
      this.atk_foto,
      // ignore: non_constant_identifier_names
      this.atk_file,
      this.jenis,
      this.tanggal});

  factory ArtikelModel.fromJson(Map<String, dynamic> json) => ArtikelModel(
      id_atk: json['id_atk'],
      atk_judul: json['atk_judul'],
      atk_isi: json['atk_isi'],
      atk_foto: json['atk_foto'],
      atk_file: json['atk_file'],
      jenis: json['jenis'],
      tanggal: json['atk_tanggal']);

  // Map<String, dynamic> toJson() => {
  //       "id_atk": id_atk,
  //       "atk_judul": atk_judul,
  //       "atk_isi": atk_isi,
  //       "atk_foto": atk_foto,
  //       "atk_file": atk_file,
  //       "jenis": jenis,
  //       "atk_tanggal": tanggal,
  //     };
}
