REDIS_CLI=redis-cli

echo "SET MODEL"
$REDIS_CLI -x AI.MODELSET foo ONNX CPU < mnist.onnx
# $REDIS_CLI AI.MODELGET foo

echo "SET TENSORS"
$REDIS_CLI -x AI.TENSORSET a FLOAT 1 1 28 28 BLOB < one.raw

echo "GET TENSORS"
$REDIS_CLI AI.TENSORGET a META

echo "RUN MODEL"
$REDIS_CLI AI.MODELRUN foo INPUTS a OUTPUTS b

echo "GET TENSOR META"
$REDIS_CLI AI.TENSORGET b META

echo "GET TENSOR VALUES"
$REDIS_CLI AI.TENSORGET b VALUES

echo "GET TENSOR BLOB"
# $REDIS_CLI --raw AI.TENSORGET b BLOB
$REDIS_CLI AI.TENSORGET b BLOB

$REDIS_CLI DEL foo a b