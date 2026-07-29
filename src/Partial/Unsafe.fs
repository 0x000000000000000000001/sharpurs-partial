let _unsafePartial f = (unbox<obj -> obj> f) (box null)
