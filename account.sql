-- account ���̺� ����
CREATE TABLE account(
    ano     VARCHAR(20) PRIMARY KEY,
    owner   VARCHAR(20) NOT NULL,
    balance NUMBER  NOT NULL
);

INSERT INTO account VALUES ('111-222-1234', '������', '1000');

COMMIT;

SELECT * FROM account;