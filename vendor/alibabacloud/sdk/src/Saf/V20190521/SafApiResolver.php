<?php

namespace AlibabaCloud\Saf\V20190521;

use AlibabaCloud\Client\Resolver\ApiResolver;

/**
 * @method ExecuteRequest executeRequest(array $options = [])
 * @method ExecuteRequestSG executeRequestSG(array $options = [])
 */
class SafApiResolver extends ApiResolver
{
}

class Rpc extends \AlibabaCloud\Client\Resolver\Rpc
{
    /** @var string */
    public $product = 'saf';

    /** @var string */
    public $version = '2019-05-21';

    /** @var string */
    public $method = 'POST';

    /** @var string */
    protected $scheme = 'https';

    /** @var string */
    public $serviceCode = 'saf';
}

/**
 * @method string getServiceParameters()
 * @method $this withServiceParameters($value)
 * @method string getService()
 * @method $this withService($value)
 */
class ExecuteRequest extends Rpc
{
}

/**
 * @method string getServiceParameters()
 * @method $this withServiceParameters($value)
 * @method string getService()
 * @method $this withService($value)
 */
class ExecuteRequestSG extends Rpc
{
}
