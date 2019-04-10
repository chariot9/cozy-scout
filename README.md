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

#### What is the output?

Result will be returned as Json format:

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
- TBD

#### Metric of score functions
- TBD
