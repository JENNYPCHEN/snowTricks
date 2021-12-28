<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use  App\Factory\UserFactory;
use  App\Factory\TrickFactory;
use  App\Factory\CommentFactory;
use  App\Factory\CategoryFactory;
use  App\Factory\VideoFactory;
use  App\Factory\ImageFactory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        UserFactory::new()->createMany(20);
        CategoryFactory::new()->createMany(7);
        TrickFactory::new()->createMany(50, function(){return ['user' => UserFactory::random(),'category' => CategoryFactory::random(), ];
        });
        VideoFactory::new()->createMany(10, function(){return ['trick' => TrickFactory::random(), ];
        });
        ImageFactory::new()->createMany(10, function(){return ['trick' => TrickFactory::random(), ];
        });
        CommentFactory::new()->createMany(100,function(){return ['user' => UserFactory::random(),'trick'=>TrickFactory::random(), ];
        });
        
        $manager->flush();
    }
}
