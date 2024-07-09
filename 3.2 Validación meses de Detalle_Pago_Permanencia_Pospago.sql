-------------Validación meses de Detalle_Pago_Permanencia_Pospago -------------

DECLARE @dia_de_corte DATE = '2024-05-26';
DECLARE @SEMANA VARCHAR(50) = 'Semana del 20 al 26 de 05-2024';

SELECT *,
    CONCAT(año, '-', mes, '-01') AS fecha,
    DATEDIFF(MONTH, DATEFROMPARTS(año, mes, 01), @dia_de_corte) AS diferencia_meses,
    CASE
        WHEN DATEDIFF(MONTH, DATEFROMPARTS(año, mes, 01), @dia_de_corte) >= 12 THEN 'OK'
        ELSE 'Es menor a 12 meses de permanencia'
    END AS Validación
FROM Detalle_Pago_Permanencia_Pospago
WHERE SEMANA = @SEMANA;


-------------Validación meses de Detalle_Pago_Permanencia_Pospago -------------
/*SELECT *,
    CONCAT(año, '-', mes, '-31') AS fecha,
    DATEDIFF(MONTH, CONCAT(año, '-', mes, '-01'), '2024-05-26') AS diferencia_meses,
    CASE
        WHEN DATEDIFF(MONTH, CONCAT(año, '-', mes, '-01'), '2024-05-26') >= 12 THEN 'OK'
        ELSE 'Es menor a 12 meses de permanencia'
    END AS Validación
FROM Detalle_Pago_Permanencia_Pospago
WHERE SEMANA = 'Semana del 20 al 26 de 05-2024';*/