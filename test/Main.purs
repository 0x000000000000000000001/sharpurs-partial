module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Partial.Unsafe (unsafePartial)

f :: Partial => Int -> Int
f 0 = 0
f _ = 1 -- crashWith doesn't exist without purescript-partial dependency, well we are in partial

safely :: Int
safely = unsafePartial (f 0)

unsafeSafely :: Int -> Int
unsafeSafely = unsafePartial f

main :: Effect Unit
main = do
  log "Testing unsafePartial..."
  let _ = safely
  let _ = unsafeSafely 0
  log "All tests passed"
