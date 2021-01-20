(module
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 ;; Assumes users passes with signature setPixel(x: number, y: number): number
 (import "env" "setPixel" (func $setPixel (param i32 i32) (result i32)))
 ;; Honestly
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "line" (func $line))
 ;; Function line(x, y, x1, y1)
 (func $line (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  ;; Declare local variables
  ;; Looks like magic :joy:
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (set_local $11
   (i32.div_s
    (select
     ;; dx
     (tee_local $4
      (i32.xor
       (i32.add
        (tee_local $11
         ;; x1 - x
         (i32.sub
          (get_local $2)
          (get_local $0)
         )
        )
        (tee_local $11
         (i32.shr_s
          (get_local $11)
          (i32.const 31)
         )
        )
       )
       (get_local $11)
      )
     )
     (i32.sub
      (i32.const 0)
      (tee_local $6
       (i32.xor
        (i32.add
         (tee_local $11
          (i32.sub
           (get_local $3)
           (get_local $1)
          )
         )
         (tee_local $11
          (i32.shr_s
           (get_local $11)
           (i32.const 31)
          )
         )
        )
        (get_local $11)
       )
      )
     )
     (i32.gt_s
      (get_local $4)
      (get_local $6)
     )
    )
    (i32.const 2)
   )
  )
  (set_local $8
   (i32.sub
    (i32.const 0)
    (get_local $4)
   )
  )
  (set_local $7
   (select
    (i32.const 1)
    (i32.const -1)
    (i32.gt_s
     (get_local $3)
     (get_local $1)
    )
   )
  )
  (set_local $5
   (select
    (i32.const 1)
    (i32.const -1)
    (i32.gt_s
     (get_local $2)
     (get_local $0)
    )
   )
  )
  (block $label$0
   ;; start looping
   (loop $label$1
    (drop
     (call $setPixel
      (get_local $0)
      (get_local $1)
     )
    )
    (block $label$2
     (br_if $label$2
      (i32.ne
       (get_local $1)
       (get_local $3)
      )
     )
     (br_if $label$0
      (i32.eq
       (get_local $0)
       (get_local $2)
      )
     )
    )
    (set_local $0
     (i32.add
      (select
       (get_local $5)
       (i32.const 0)
       (tee_local $9
        (i32.gt_s
         (get_local $11)
         (get_local $8)
        )
       )
      )
      (get_local $0)
     )
    )
    (set_local $10
     (i32.ge_s
      (get_local $11)
      (get_local $6)
     )
    )
    (set_local $11
     (tee_local $9
      (i32.sub
       (get_local $11)
       (select
        (get_local $6)
        (i32.const 0)
        (get_local $9)
       )
      )
     )
    )
    (br_if $label$1
     (get_local $10)
    )
    (set_local $1
     (i32.add
      (get_local $1)
      (get_local $7)
     )
    )
    (set_local $11
     (i32.add
      (get_local $9)
      (get_local $4)
     )
    )
    ;; branch to break check block
    (br $label$1)
   )
  )
 )
)
