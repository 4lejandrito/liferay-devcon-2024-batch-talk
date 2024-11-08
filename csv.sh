#!/bin/sh

curl -s https://raw.githubusercontent.com/Purukitto/pokemon-data.json/refs/heads/master/pokedex.json | jq -r '[.[] | {
     id: .id, nombre: .name.english,
     tipo: .type[0],
     altura: .profile.height,
     peso: .profile.weight,
     url_de_imagen: .image.thumbnail
 }] | (map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @csv' | sed 's/"//g' | awk '{printf "%s\r\n", $0}'