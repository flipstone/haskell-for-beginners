-- Implement an Encryption module that provides functions
-- for One-time pad and Caesar ciphers. The module should
-- only expose the functions you intend to be called. It
-- should hide any internal functions you created.
--
-- The key for a Caesar cipher is a single int
-- The key for a One-time pad is a list of ints
--
-- Import the module here and demonstrate it's use by
-- encrypting / decrypting some messages.
--
-- if ghci has trouble finding the module's source file,
-- try running this at the ghci prompt:
--   :set -i<dir that contains the file>

import Encryption

shift = 13
pad = [26,10,1,34,32,13,90]

caesarHello = encryptCaesar shift "hello"
hello = decryptCaesar shift caesarHello

paddedGoodbye = encryptPad pad "goodbye"
goodbye = decryptPad pad paddedGoodbye

