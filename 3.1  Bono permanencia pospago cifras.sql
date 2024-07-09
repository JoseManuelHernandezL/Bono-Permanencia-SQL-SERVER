
------------------------------Cabecera_Payfile_Permanencia_Pospago------------------------------
SELECT *
FROM(
	SELECT 
		SEMANA,
		FUENTE AS ARCHIVO,
		CASE 
			WHEN SERVICIO = 'PERMANENCIA' THEN 'Bono Permanencia'
			ELSE SERVICIO
		END AS SERVICIO,
		SUM(CONTEO) AS UNIDADES,
		SUM(IMPORTE) AS IMPORTE
	FROM Cabecera_Payfile_Permanencia_Pospago
	GROUP BY SEMANA, FUENTE, SERVICIO
	UNION ALL
	------------------------------Detalle_Payfile_Permanencia_Pospago------------------------------
	SELECT 
		SEMANA,
		FUENTE AS ARCHIVO,
		'Bono Permanencia' AS SERVICIO,
		SUM (CONTEO) AS UNIDADES,
		SUM (IMPORTE) AS IMPORTE
	FROM Detalle_Payfile_Permanencia_Pospago
	GROUP BY SEMANA,FUENTE
	UNION ALL
	------------------------------Detalle_Pago_Permanencia_Pospago------------------------------
	SELECT 
		SEMANA,
		FUENTE AS ARCHIVO,
		EVENTTYPE AS SERVICIO,
		SUM(PERMANENCIA) AS UNIDADES,
		SUM(IMPORTE_BONO_PERMANENCIA) AS IMPORTE
	FROM Detalle_Pago_Permanencia_Pospago
	GROUP BY SEMANA, FUENTE, EVENTTYPE
	UNION ALL
	------------------------------Detalle_Bonos_Permanencia_WEBI------------------------------
	SELECT 
		SEMANA,
		FUENTE AS ARCHIVO,
		'Bono Permanencia' AS SERVICIO,
		COUNT([Num Cuenta]) AS UNIDADES,
		NULL AS IMPORTE
	FROM Detalle_Bonos_Permanencia_WEBI
	GROUP BY SEMANA, FUENTE
	UNION ALL
	------------------------------Detalle_Bonos_Permanencia%_WEBI------------------------------
	SELECT 
		SEMANA,
		FUENTE AS ARCHIVO,
		'Bono Permanencia' AS SERVICIO,
		SUM(Permanencia) AS UNIDADES,
		NULL AS IMPORTE
	FROM Detalle_Bonos_Permanencia_porcentaje_WEBI
	GROUP BY SEMANA, FUENTE) as a
WHERE SEMANA = 'Semana del 20 al 26 de 05-2024'


