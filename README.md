# CKAN JSON Dump

This is a simple Ruby script that retrieves all datasets from a CKAN instance and dumps them all to a big JSON file.

I use this to query the data catalog with [jq](https://stedolan.github.io/jq/).

## Requirements

- Ruby: Has been developed with Ruby 2.7.1 and uses only core and standard library classes (no additional gems required).
- [jq](https://stedolan.github.io/jq/): If you want to query the dump.

## Running the Script

The `dump_ckan` script takes two mandatory parameters:

- `-s, --source`: the URL of the CKAN instance
- `-t, --target`: a local file-system path for the JSON dump we want to create

Example:

```
$ ruby dump_ckan.rb --source https://datenregister.berlin.de --target datenregister.berlin.de.20200819.json
I, [2020-08-20T09:51:18.342849 #90068]  INFO -- : 0001 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=20-grune-hauptwege-koordinaten-fur-spazier-und-wanderstrecken-mit-einer-gesamtlange-von-ca-600k
I, [2020-08-20T09:51:18.505115 #90068]  INFO -- : 0002 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=20-grune-hauptwege-wanderkarte-wfs-99a22ff0
I, [2020-08-20T09:51:18.655566 #90068]  INFO -- : 0003 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=20-grune-hauptwege-wanderkarte-wms-1f028343
I, [2020-08-20T09:51:18.784938 #90068]  INFO -- : 0004 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=3d-gebaudemodelle-im-level-of-detail-2-lod-2-wms-f2a8a483
...
I, [2020-08-20T10:15:25.479790 #90989]  INFO -- : 2285 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=zugriffsstatistik-daten-berlin-de-historisch
I, [2020-08-20T10:15:25.596488 #90989]  INFO -- : 2286 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=zuschusse-des-religions-und-weltanschauungsunterrichts
I, [2020-08-20T10:15:25.711112 #90989]  INFO -- : 2287 of 2287: https://datenregister.berlin.de/api/3/action/package_show?id=zuwendungen-in-berlin
```

Depending on the size of the portal (number of datasets), this can take a few minutes to finish.

## Target Data

The resulting JSON dump has the following structure:

```json
{
    "source": "https://datenregister.berlin.de",
    "dump_started": "2020-08-20T10:10:00+02:00",
    "dump_finished": "2020-08-20T10:15:25+02:00",
    "datasets": [
        {
            "berlin_type": "datensatz",
            "berlin_source": "webform",
            "type": "dataset",
            "state": "active",
            "title": "Suchbegriffe daten.berlin.de",
            "name": "suchbegriffe-daten-berlin-de",
            "url": "https://berlinonline.github.io/berlin_dataportal_searchterms/",
            "notes": "Wonach suchen die NutzerInnen des Berliner Datenportals?\r\n\r\nDer Datensatz listet die Suchbegriffe, die über die Freitext-Suche des Datenportals gesucht wurden. Die Daten sind nach Monaten gegliedert (beginnend mit Februar 2019); für jeden Suchbegriff werden die Summe der Page Impressions, Visits und weitere Daten angegeben.\r\n\r\nDie Daten sind nicht normalisiert (z.B. Groß-/Kleinschreibung). Persönliche Daten (Namen, Adressen etc.) wurden vor der Veröffentlichung entfernt.",
            "author": "BerlinOnline Stadtportal GmbH & Co. KG",
            "author_email": null,
            "maintainer": "Knud Möller",
            "maintainer_email": "opendata@berlin.de",
            "owner_org": "ec19c71d-6f16-47fd-8378-2d3ac4c6182f",
            "creator_user_id": "b1e7b5de-7dab-497a-ba76-867bf93f22b3",
            "license_id": "cc-by",
            "license_title": "Creative Commons Attribution",
            "license_url": "https://opendefinition.org/licenses/cc-by/",
            "date_released": "2020-06-02",
            "date_updated": "2020-08-03",
            "id": "b4a3247b-e91d-40c8-bf47-7816ccf790c5",
            "metadata_created": "2020-06-02T20:36:09.305371",
            "metadata_modified": "2020-08-03T13:49:53.200617",
            "geographical_coverage": "Keine",
            "geographical_granularity": "Keine",
            "temporal_granularity": "Monat",
            "temporal_coverage_from": "2019-02-01",
            "temporal_coverage_to": "2020-07-31",
            "attribution_text": "",
            "num_resources": 2,
            "resources": [
                {
                "description": "PIs, Visits u.a. pro Suchbegriff pro Monat",
                "format": "JSON",
                "url": "https://berlinonline.github.io/berlin_dataportal_searchterms/data/target/daten_berlin_de.searchterms.json",
                "created": "2020-06-02T20:44:17.011786",
                "state": "active",
                "package_id": "b4a3247b-e91d-40c8-bf47-7816ccf790c5",
                "position": 0,
                "revision_id": "8bb219db-b8e1-4559-9a77-cd981d33662a",
                "id": "69bcc290-2a6f-49d5-aef4-b7854a814e5a",
                "name": "daten.berlin.de Suchbegriffe"
                },
                {
                "description": "",
                "format": "PDF",
                "url": "https://berlinonline.github.io/berlin_dataportal_searchterms/README.pdf",
                "created": "2020-06-02T20:45:50.127137",
                "state": "active",
                "package_id": "b4a3247b-e91d-40c8-bf47-7816ccf790c5",
                "position": 1,
                "revision_id": "6be57fb6-77eb-4f04-98af-9ddd809796fa",
                "id": "21fafb6e-5057-4517-8df8-90870e29855e",
                "name": "daten.berlin.de Suchbegriffe, Dokumentation"
                }
            ],
            "num_tags": 4,
            "tags": [
                {
                "state": "active",
                "display_name": "open data",
                "id": "cc72f74d-f537-4479-b4b6-adb7eb1dac7d",
                "name": "open data"
                },
                {
                "state": "active",
                "display_name": "portal",
                "id": "7ed886fd-69be-47d6-b6e6-30d32c614bb8",
                "name": "portal"
                },
                {
                "state": "active",
                "display_name": "search",
                "id": "7ac471dd-54a5-4043-98fb-8a8dd7c0a832",
                "name": "search"
                },
                {
                "state": "active",
                "display_name": "usage",
                "id": "12b330ff-c849-4287-a1b0-0825394281d9",
                "name": "usage"
                }
            ],
            "groups": [
                {
                "display_name": "Öffentliche Verwaltung, Haushalt und Steuern",
                "title": "Öffentliche Verwaltung, Haushalt und Steuern",
                "id": "e7807760-2c0a-41ca-87b7-010f1ddc2d30",
                "name": "verwaltung"
                }
            ],
            "isopen": true,
            "organization": {
                "title": "BerlinOnline Stadtportal GmbH & Co KG",
                "created": "2016-01-29T17:10:39.109585",
                "is_organization": true,
                "state": "active",
                "revision_id": "fd5f77af-439f-4764-94f2-3bdb91ba26d6",
                "type": "organization",
                "id": "ec19c71d-6f16-47fd-8378-2d3ac4c6182f",
                "name": "berlinonline-stadtportal-gmbh-co-kg"
            },
            "revision_id": "3e12d368-beb8-40f1-b00e-af443d8e2276"
        },
        ...
    ]
}
```

Each member of `datasets` corresponds to the extended CKAN schema documented here: https://datenregister.berlin.de/schema/.

Please note that, for the Berlin Open Data Portal, the `organization` field cannot be used to identify the department which published a dataset! For that, you need to use `author`.

## Example Queries

Once you have the dump in a local file, you can use `jq` to query it.

### Unique Authors

In the Berlin Open Data Portal, the `author` field is used to specify the organization that has published a dataset. Unfortunately, this is a free form text field, so there is a problem with spelling variations for the same organization.


```
$ cat datenregister.berlin.de.20200819.json | jq '[.datasets[] | { author: .author } ] | unique_by(.author)'

[
  {
    "author": null
  },
  {
    "author": " Bezirksamt Friedrichshain-Kreuzberg von Berlin - Vermessung"
  },
  {
    "author": " VBB - Verkehrsverbund Berlin-Brandenburg GmbH "
  },
  {
    "author": "Amt für Statistik Berlin- Brandenburg"
  },
  {
    "author": "Amt für Statistik Berlin-Brandenburg"
  },
...
]
```

### Datasets with a Specific Maintainer-E-Mail

Get all datasets with a specific maintainer-e-mail, select only the `title`, `owner_org` and `groups` fields, sort by `owner_org` and `title`.


```
$ cat datenregister.berlin.de.20200819.json | jq '[.datasets[] | select(.maintainer_email == "opendata@berlin.de") | {title: .title, name: .name, owner_org: .owner_org, groups: .groups} ] | sort_by(.owner_org, .title)'

[
  {
    "title": "Datenportal Jahresrückblick 2018",
    "name": "datenportal-jahresruckblick-2018",
    "owner_org": "ec19c71d-6f16-47fd-8378-2d3ac4c6182f",
    "groups": []
  },
  {
    "title": "Liste der häufigen Vornamen 2012",
    "name": "liste-der-h-ufigen-vornamen-2012",
    "owner_org": "ec19c71d-6f16-47fd-8378-2d3ac4c6182f",
    "groups": [
      {
        "display_name": "Demographie",
        "description": "",
        "image_display_url": "",
        "title": "Demographie",
        "id": "b69c6ad4-d9a1-407d-8cc0-aa7ab4848145",
        "name": "demographie"
      },
      {
        "display_name": "Jugend",
        "description": "",
        "image_display_url": "",
        "title": "Jugend",
        "id": "48757ea8-2b13-4360-bbd6-c6d9c5eebf7f",
        "name": "jugend"
      }
    ]
  },
  ...
]
```

## License

All software in this repository is published under the [MIT License](LICENSE).

---

2020, Knud Möller, [BerlinOnline Stadtportal GmbH & Co. KG](https://www.berlinonline.net)

Last changed: 2020-08-20


