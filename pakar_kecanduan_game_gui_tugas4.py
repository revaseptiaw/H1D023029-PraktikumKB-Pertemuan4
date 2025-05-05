import tkinter as tk
from tkinter import messagebox, ttk
from pyswip import Prolog

class DiagnosaGame:
    def __init__(self, root):
        self.root = root
        self.root.title("Deteksi Kecanduan Game Online")
        self.root.geometry("700x400")
        self.root.configure(bg="#f4f4f8")

        self.prolog = Prolog()
        self.prolog.consult("pakar_kecanduan_game_tugas4.pl")

        self.gejala = [
            ("g1", "Memiliki keinginan bermain game setiap waktu"),
            ("g2", "Pola hidup mulai tidak teratur atau terganggu"),
            ("g3", "Marah jika diganggu bermain game"),
            ("g4", "Malas jika disuruh mengerjakan sesuatu selain game"),
            ("g5", "Sangat antusias jika ditanya mengenai game"),
            ("g6", "Tidak bisa konsentrasi saat melakukan suatu pekerjaan"),
            ("g7", "Terlihat sering mengantuk karena sering begadang bermain game"),
            ("g8", "Rela mengeluarkan uang untuk bermain game"),
            ("g9", "Melupakan aktivitas sehari-hari seperti makan, mandi, dan lainnya"),
            ("g10", "Kurang bersosialisasi"),
            ("g11", "Tidak tertarik terhadap aktivitas lain"),
            ("g12", "Sering menyembunyikan kebiasaan bermain game online dari orang lain"),
            ("g13", "Bersosial di game online lebih penting dari dunia nyata"),
            ("g14", "Cemas jika tidak bermain game online"),
            ("g15", "Bermain game untuk pelarian")
        ]

        self.index = 0
        self.selected_gejala = []

        self.title_label = tk.Label(root, text="Diagnosa Kecanduan Game Online🕹️", font=("Helvetica", 18, "bold"), bg="#f4f4f8", fg="#333")
        self.title_label.pack(pady=10)

        self.label = tk.Label(root, text="Tekan tombol di bawah untuk memulai diagnosa", font=("Helvetica", 14), bg="#f4f4f8", wraplength=600)
        self.label.pack(pady=20)

        self.progress = ttk.Progressbar(root, orient="horizontal", length=500, mode="determinate")
        self.progress.pack(pady=10)
        self.progress["maximum"] = len(self.gejala)

        self.button_frame = tk.Frame(root, bg="#f4f4f8")
        self.button_frame.pack()

        self.start_button = tk.Button(self.button_frame, text="🎮 Mulai Diagnosa", font=("Helvetica", 12), bg="#4CAF50", fg="white", width=20, command=self.mulai_diagnosa)
        self.start_button.pack()

    def mulai_diagnosa(self):
        self.start_button.destroy()
        self.tampilkan_pertanyaan()

    def tampilkan_pertanyaan(self):
        if self.index < len(self.gejala):
            kode, pertanyaan = self.gejala[self.index]
            self.label.config(text=f"{pertanyaan}?")
            self.progress["value"] = self.index

            for widget in self.button_frame.winfo_children():
                widget.destroy()

            ya_btn = tk.Button(self.button_frame, text="✔️ Ya", width=15, font=("Helvetica", 12),
                               bg="#2196F3", fg="white", command=lambda: self.jawab(True))
            tidak_btn = tk.Button(self.button_frame, text="❌ Tidak", width=15, font=("Helvetica", 12),
                                  bg="#f44336", fg="white", command=lambda: self.jawab(False))

            ya_btn.grid(row=0, column=0, padx=10, pady=10)
            tidak_btn.grid(row=0, column=1, padx=10, pady=10)
        else:
            self.proses_diagnosa()

    def jawab(self, ya):
        kode, _ = self.gejala[self.index]
        if ya:
            self.selected_gejala.append(kode)
        self.index += 1
        self.tampilkan_pertanyaan()

    def proses_diagnosa(self):
        for widget in self.button_frame.winfo_children():
            widget.destroy()

        self.label.config(text="🔍 Menganalisis hasil diagnosa...")

        list(self.prolog.query("retractall(cek(_))"))
        for kode in self.selected_gejala:
            list(self.prolog.query(f"asserta(cek({kode}))"))

        hasil = list(self.prolog.query("kecanduan(X), hasil(X, Hasil)"))

        self.progress["value"] = len(self.gejala)

        if hasil:
            messagebox.showinfo("🧠 Hasil Diagnosa", f"Tingkat kecanduan Anda: {hasil[0]['Hasil']}")
        else:
            messagebox.showinfo("🧠 Hasil Diagnosa", "Tingkat kecanduan tidak terdeteksi.")

        self.root.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    app = DiagnosaGame(root)
    root.mainloop()
