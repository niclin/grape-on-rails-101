# Grape on Rails 101 範例

[本書連結](https://legacy.gitbook.com/book/niclin/grape-on-rails-101/details)

對於 Ruby on Rails 的開發者來說，前端 + 後端 + DevOps 一起碰已是家常便飯。

在這個需求越來越複雜，前端也跟著複雜的情況下，前後端分離的架構也越來越常見。

那麼，因為能夠應用於各種 Client 端的需求，API 的開發需求就此而生。

而 Grape on Rails 是目前開發 API 最輕便有名氣的框架，但往往網路上只有簡單的基礎教學，比較少有架構的介紹

包含從 Auth 驗證、Exception 異常處理、Helper 的使用，以及 CRUD 和單元測試的完整一條龍

本書除了是作者自己的筆記以外，也希望能夠幫助更多初入門開發 API 的開發者們。

## API 目錄結構

```
app/api
├── api_root.rb
└── api_v0
    ├── auth
    │   ├── authenticator.rb
    │   └── middleware.rb
    ├── base.rb
    ├── entities
    │   ├── base.rb
    │   └── post.rb
    ├── exception_handlers.rb
    ├── helpers.rb
    ├── ping.rb
    └── posts.rb

```
