{{ config(
        alias ='current_owners_per_token',
        post_hook='{{ expose_spells(\'["ethereum"]\',
                                    "project",
                                    "cryptopunks",
                                    \'["cat"]\') }}'
        )
}}

select punk_id
        , to as current_owner
        , evt_block_time as last_transfer_time
from  {{ ref('cryptopunks_ethereum_punk_transfers') }}
where punk_id_tx_rank = 1 
order by cast(punk_id as int) asc
;