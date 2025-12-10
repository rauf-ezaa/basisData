START TRANSACTION;

SELECT balance FROM accounts
WHERE id = 1
FOR UPDATE;

UPDATE accounts
SET balance = balance - 500000
WHERE id = 1 AND balance >= 500000;

-- Cek apakah baris ter-update
SELECT ROW_COUNT() AS rows_affected;

-- ROW_COUNT() = 0 → saldo tidak cukup → batalkan
ROLLBACK;
