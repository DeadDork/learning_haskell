module Types () where
  data IExp = IExpCst Int
            | IExpNeg (IExp)
            | IExpAdd (IExp, IExp)
            | IExpSub (IExp, IExp)
            | IExpMul (IExp, IExp)
            | IExpDiv (IExp, IExp)

  evalIexp :: IExp -> Int
  evalIexp (IExpCst i)         = i
  evalIexp (IExpNeg ie0)        = -(evalIexp ie0)
  evalIexp (IExpAdd (ie1, ie2)) = evalIexp ie1 + evalIexp ie2
  evalIexp (IExpSub (ie1, ie2)) = evalIexp ie1 - evalIexp ie2
  evalIexp (IExpMul (ie1, ie2)) = evalIexp ie1 * evalIexp ie2
  evalIexp (IExpDiv (ie1, ie2)) = evalIexp ie1 `div` evalIexp ie2

  -- Passes the test
  test :: Int
  test = evalIexp (IExpAdd(
                    IExpNeg(
                      IExpCst(1))
                  , IExpMul(
                      IExpSub(
                        IExpCst(2)
                      , IExpCst(3))
                    , IExpCst(4))))
