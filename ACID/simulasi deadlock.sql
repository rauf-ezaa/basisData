SET autocommit = 0;
BEGIN;


START TRANSACTION;
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
-- saldo terlihat 1000
UPDATE accounts SET balance = balance - 500 WHERE id = 1 AND balance >= 500;
-- jangan COMMIT dulu, biarkan transaksi menggantung


-- pembatas query sesi 2
START TRANSACTION;
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
ROLLBACK;
-- << sesi 2 akan terblokir! >>


-- sesi 1
START TRANSACTION;
SELECT * FROM accounts WHERE id = 1 FOR UPDATE;
-- kemudian
SELECT * FROM accounts WHERE id = 2 FOR UPDATE;

-- sesi 2
START TRANSACTION;
SELECT * FROM accounts WHERE id = 1 FOR UPDATE;
-- kemudian
SELECT * FROM accounts WHERE id = 2 FOR UPDATE;









