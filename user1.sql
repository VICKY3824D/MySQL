START TRANSACTION;

SELECT * FROM guestbooks;

UPDATE guestbooks 
SET title = 'Crypto Currency' 
WHERE id IN(5);

COMMIT;

-- manual locking
SELECT * FROM skor_mhs WHERE score_id = 7 FOR UPDATE;

UPDATE skor_mhs
SET score = score - 12
WHERE score_id = 7;