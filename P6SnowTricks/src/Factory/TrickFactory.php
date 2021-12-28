<?php

namespace App\Factory;

use App\Entity\Trick;
use App\Repository\TrickRepository;
use Zenstruck\Foundry\RepositoryProxy;
use Zenstruck\Foundry\ModelFactory;
use Zenstruck\Foundry\Proxy;

/**
 * @extends ModelFactory<Trick>
 *
 * @method static Trick|Proxy createOne(array $attributes = [])
 * @method static Trick[]|Proxy[] createMany(int $number, array|callable $attributes = [])
 * @method static Trick|Proxy find(object|array|mixed $criteria)
 * @method static Trick|Proxy findOrCreate(array $attributes)
 * @method static Trick|Proxy first(string $sortedField = 'id')
 * @method static Trick|Proxy last(string $sortedField = 'id')
 * @method static Trick|Proxy random(array $attributes = [])
 * @method static Trick|Proxy randomOrCreate(array $attributes = [])
 * @method static Trick[]|Proxy[] all()
 * @method static Trick[]|Proxy[] findBy(array $attributes)
 * @method static Trick[]|Proxy[] randomSet(int $number, array $attributes = [])
 * @method static Trick[]|Proxy[] randomRange(int $min, int $max, array $attributes = [])
 * @method static TrickRepository|RepositoryProxy repository()
 * @method Trick|Proxy create(array|callable $attributes = [])
 */
final class TrickFactory extends ModelFactory
{
    public function __construct()
    {
        parent::__construct();

        // TODO inject services if required (https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#factories-as-services)
    }

    protected function getDefaults(): array
    {
        return [
            // TODO add your default values here (https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#model-factories)
            'name' => self::faker()->unique()->text(20),
            'description' => self::faker()->paragraph(self::faker()->numberBetween(1, 3),
            true),
            'createDate' => self::faker()->dateTimeBetween('-30 days', '-20 days'),
            'updateDate' => self::faker()->dateTimeBetween('-20 days', '-1 days')
        ];
    }

    protected function initialize(): self
    {
        // see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
        return $this
            // ->afterInstantiate(function(Trick $trick): void {})
        ;
    }

    protected static function getClass(): string
    {
        return Trick::class;
    }
}
