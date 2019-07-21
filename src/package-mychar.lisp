(defpackage gaw1/mychar
  (:use 
    cl
    gaw1/actor-ex
    gaw1/weapon)
  (:shadowing-import-from 
    gaw1/weapon 
    updt)
  (:export 
    mychar))

