(defpackage gaw1/tests/main
  (:use :cl
        :gaw1
        :rove))
(in-package :gaw1/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :gaw1)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
