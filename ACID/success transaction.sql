-- 1. Mulai transaksi manual
START TRANSACTION;

-- 2. Mengunci baris saldo pengirim agar transaksi lain tidak bisa mengubah/membacanya
SELECT balance FROM accounts
WHERE id = 1
FOR UPDATE;

-- 3. Cek saldo cukup: kurangi saldo pengirim
UPDATE accounts
SET balance = balance - 200
WHERE id = 1 AND balance >= 200;

-- 4. Tambah saldo penerima
UPDATE accounts
SET balance = balance + 200
WHERE id = 2;

-- 5. Catat ke tabel log
INSERT INTO transfers (from_account, to_account, amount, status)
VALUES (1, 2, 200, 'success');

-- 6. Jika semua langkah di atas berhasil
COMMIT;
