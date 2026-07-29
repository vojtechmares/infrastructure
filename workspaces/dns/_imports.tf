# Import blocks for pre-existing Cloudflare objects that were created outside
# Terraform. Remove a block once its apply has landed and the resource is in
# state.

##
# vojtamares.cz - zone plus the mail authentication records (SPF, DMARC, DKIM).
##

import {
  to = cloudflare_zone.vojtamares_cz
  id = "9aaee1bb46c113ac4d37f60dea6ea0b9"
}

import {
  to = cloudflare_dns_record.spf_vojtamares_cz
  id = "9aaee1bb46c113ac4d37f60dea6ea0b9/f70b456fba6d2cebe024149c182d88eb"
}

import {
  to = cloudflare_dns_record.dmarc_vojtamares_cz
  id = "9aaee1bb46c113ac4d37f60dea6ea0b9/a599c14c30b97e86535a3d12363069c6"
}

import {
  to = cloudflare_dns_record.dkim_vojtamares_cz
  id = "9aaee1bb46c113ac4d37f60dea6ea0b9/7e891ad39d8f683fdca5989414a1618f"
}

import {
  to = cloudflare_dns_record.mx01_vojtamares_cz
  id = "9aaee1bb46c113ac4d37f60dea6ea0b9/4fc94d6656f6aba674c43ede8309777c"
}

import {
  to = cloudflare_dns_record.mx02_vojtamares_cz
  id = "9aaee1bb46c113ac4d37f60dea6ea0b9/08ea418b2f9259c0a569d089cfb8c402"
}
