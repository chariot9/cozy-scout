`Since the road is continuing eternally, let's drive forever!` -- Trung Vu

## Getting started
`cozy-scout` Private company information searching API with Ruby on Rails and Elasticsearch


#### What is `Private company information`?

As you know, `Private company` is a company which isn't listed in `Stock market`.



#### What is the data?
| id | tax_code | company_name_vn | company_name_en |
| --- | --- | --- | --- |
9 | 2000527350 | CONG TY TNHH MOT THANH VIEN THUY SAN THIEN MA | THIMEX LTD., COMPANY
20 | 2000413473 | CONG TY TNHH THUONG MAI NGOC ANH | NGOC ANH TRADING COMPANY LIMITED
28 | 2000503303 | CÔNG TY TNHH CHẾ BIẾN THỦY SẢN XUẤT NHẬP KHẨU MINH CHÂU | MINH CHAU IMPORT – EXPORT SEAFOOD PROCESSING COMPANY LIMITED
29 | 2000336035 | CONG TY CP CHE BIEN THUY SAN XUAT KHAU TAC VAN | TACVAN SEAFOODS COMPANY
31 | 2000401090 | CONG TY CP THUC PHAM THUY SAN XUAT KHAU CA MAU | FINE FOODS CO

- Description: 
   +  `id`: ID of company
   +  `tax_code`: registration tax code
   +  `company_name_vn`: Company name in Vietnamese
   +  `company_name_en`: Company name in English
   + `...`

#### What is the output?

Result will be returned as Json format:
Searching query: `http://localhost:3001/api/v1/search?keyword=VIEN`

```json
{
  "total_count": 15,
  "company_ids": [
    82,
    39,
    41,
    45,
    81
  ],
  "company_names": [
    "CONG TY TNHH MOT THANH VIEN KHAI THAC CONG TRINH THUY LOI TINH HAI DUONG",
    "CONG TY TNHH MOT THANH VIEN XANG DAU CA MAU",
    "CONG TY TNHH MOT THANH VIEN TAN HAI",
    "CONG TY TNHH MOT THANH VIEN BACH VIET",
    "CONG TY TNHH MOT THANH VIEN XUAN LOC"
  ],
  "scores": [
    45271.0,
    5191.0,
    1501.0,
    901.0,
    661.0
  ],
  "explains": [
    {},
    {},
    {},
    {},
    {}
  ],
  "options": null
}

```

Result contains list of `company id, company name, score`

#### How did I build the the API?
- The API contains **three mains layers**:
  + **Infrastructure:**
    Contains the logic to access data from Elasticsearch, Elasticsearch configuration for searching (factor weight, filter logic...).
  + **Core logic:**
	Contains the core logic of API, main classes, data classes/objects.
  + **Interface:**
	API endpoint, searching layer, building search params, search options and pass it to **Core logic** and get the result and pass it to client as JSON format.

#### Metric of score functions
- **Step 1: Filter**
   + **Filter only active companies:**
   ```ruby
	   # Filter only active companies
        def active_companies
          {
            bool: {
              must_not: {
                term: {
                  enterprise_status_id: ACTIVE_SIGN
                }
              }
            }
          }
        end
   ```
   + **Filter only existing companies:**
   ```ruby
	   # Filter only the existing company (not marked as deleted)
        def existing_companies
          {
            not: {
              term: {
                action_code: DELETED_COMPANY_SIGN
              }
            }
          }
        end
   ```
   + **Keyword matching:**
   ```ruby
	   # Match search keyword in company_name_vn
        def match
          {
            query: {
              multi_match: {
                query: config.query[:keyword],
                fields: ["company_name_vn", "company_name_en", "website", "registered_address_vn", "registered_address_en", "company_type"]
              }
            }
          }
        end
   ```
- **Step 2: Scoring**
   + **Attractive factor:** base on number of employee for each company
    ```ruby
		def score_function
          [
            {
              script_score: {
                params: {
                  weight: 30
                },
                script: 'weight * _source.number_of_empl'
              }
            }
          ]
        end
    ```
