#!/bin/sh

curl -X POST -u test@liferay.com:test -H "Content-Type: text/csv" --data-binary @pokemon.csv 'http://localhost:8080/o/headless-batch-engine/v1.0/import-task/com.liferay.object.rest.dto.v1_0.ObjectEntry?taskItemDelegateName=C_Pokemon&fieldNameMapping=nombre%3Dname,tipo%3Dtype,id%3DexternalReferenceCode,url_de_imagen%3DimageURL&createStrategy=UPSERT'
