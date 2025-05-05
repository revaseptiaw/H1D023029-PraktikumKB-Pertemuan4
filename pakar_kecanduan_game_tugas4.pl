% Fakta Gejala
gejala(g1, 'Memiliki keinginan bermain game setiap waktu').
gejala(g2, 'Pola hidup mulai tidak teratur atau terganggu').
gejala(g3, 'Marah jika diganggu bermain game').
gejala(g4, 'Malas jika disuruh mengerjakan sesuatu selain game').
gejala(g5, 'Sang%at antusias jika ditanya mengenai game').
gejala(g6, 'Tidak bisa konsentrasi saat melakukan suatu pekerjaan').
gejala(g7, 'Terlihat sering mengantuk karena sering begadang bermain game').
gejala(g8, 'Rela mengeluarkan uang untuk bermain game').
gejala(g9, 'Melupakan aktivitas sehari-hari seperti makan, mandi, dan lainnya').
gejala(g10, 'Kurang bersosialisasi').
gejala(g11, 'Pemain tidak memiliki ketertarikan terhadap aktivitas lain').
gejala(g12, 'Sering menyembunyikan kebiasaan bermain game online dari orang lain').
gejala(g13, 'Menganggap bersosial di game online lebih penting dari bersosial di kehidupan nyata').
gejala(g14, 'Menjadi cemas jika tidak bermain game online').
gejala(g15, 'Bermain game untuk pelarian').

% Aturan Kecanduan Sedang (p2)
kecanduan(p2) :- cek(g14).
kecanduan(p2) :- cek(g14), cek(g11).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3), cek(g13).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3), cek(g13), cek(g9).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3), cek(g13), cek(g9), cek(g8).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3), cek(g13), cek(g9), cek(g7).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3), cek(g13), cek(g9), cek(g7), cek(g5).
kecanduan(p2) :- cek(g14), cek(g11), cek(g10), cek(g3), cek(g13), cek(g9), cek(g7), cek(g5), cek(g1).

% Aturan Kecanduan Berat (p3)
kecanduan(p3) :- cek(g2).
kecanduan(p3) :- cek(g2), cek(g4).
kecanduan(p3) :- cek(g2), cek(g4), cek(g6).
kecanduan(p3) :- cek(g2), cek(g4), cek(g6), cek(g12).
kecanduan(p3) :- cek(g2), cek(g9).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8), cek(g14).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8), cek(g14), cek(g11).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8), cek(g14), cek(g11), cek(g13).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8), cek(g14), cek(g11), cek(g13), cek(g7).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8), cek(g14), cek(g11), cek(g13), cek(g7), cek(g5).
kecanduan(p3) :- cek(g2), cek(g9), cek(g8), cek(g14), cek(g11), cek(g13), cek(g7), cek(g5), cek(g1).

% Aturan Kecanduan Ringan (p1) hanya jika bukan sedang atau berat
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10), cek(g3).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10), cek(g3), cek(g13).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10), cek(g3), cek(g13), cek(g9).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10), cek(g3), cek(g13), cek(g9), cek(g7).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10), cek(g3), cek(g13), cek(g9), cek(g7), cek(g5).
kecanduan(p1) :- \+ kecanduan(p2), \+ kecanduan(p3), cek(g15), cek(g10), cek(g3), cek(g13), cek(g9), cek(g7), cek(g5), cek(g1).

% Interpretasi Hasil
hasil(p1, 'Kecanduan Ringan').
hasil(p2, 'Kecanduan Sedang').
hasil(p3, 'Kecanduan Berat').

% Dinamis agar bisa dimodifikasi dari luar
:- dynamic(cek/1).






