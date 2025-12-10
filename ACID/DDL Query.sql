-- 1. Membuat tabel accounts untuk menyimpan saldo tiap rekening
CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,         -- primary key unik
    account_no VARCHAR(32) UNIQUE NOT NULL,    -- nomor rekening
    owner VARCHAR(100),                        -- nama pemilik
    balance DECIMAL(15,2) NOT NULL DEFAULT 0,  -- saldo
    CHECK (balance >= 0)                        -- constraint: tidak boleh negatif
);

-- 2. Membuat tabel transfer log untuk mencatat transaksi
CREATE TABLE transfers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT NOT NULL,
    to_account INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    status ENUM('pending','success','failed') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (from_account) REFERENCES accounts(id),
    FOREIGN KEY (to_account) REFERENCES accounts(id)
);

-- 3. Insert saldo awal untuk simulasi
INSERT INTO accounts (account_no, owner, balance)
VALUES
('0001', 'Alice', 1000.00),    -- pengirim
('0002', 'Bob',   500.00);     -- penerima
