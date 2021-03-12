User.destroy_all
Picture.destroy_all
Review.destroy_all

juan = User.create(
    {
    name: "Juan",
    password: "juan"
    }
)

stela = User.create(
    {
        name: "Stela",
        password: "stela"
    }
)

   picture = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/1a/83/dc/1a83dcc6e0089f7caaacafc1b95a16be.jpg",
        description: "DON'T WAIT...LIFE GOES FASTER THAN YOU THINK:",
        user_id: stela.id
    })
    picture1 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/14/b0/69/14b069f4d661973adc0ffc808750bbc2.jpg",
        description: "Feel Better, Anytime & Anywhere",
        user_id: stela.id
    })
    picture2 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/22/43/ef/2243ef70727cfae5cd58fc449d05b9b7.jpg",
        description: "SUMMER LIGHTROOM PRESETS…",
        user_id: stela.id
    })
    picture3 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/3d/3d/70/3d3d7057727bdf4301a76142ab7ad294.jpg",
        description: "Toskania - kraina spokoju i sielankowej beztroski",
        user_id: stela.id
    })
    picture4 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/9a/42/d2/9a42d2eefecf54ba3971a5bd1ca08fb4.jpg",
        description: "Konoha High School- 2° temporada",
        user_id: juan.id
    })
    picture5 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/e2/26/09/e2260992d9efd2751dbf290add282eb7.jpg",
        description: "Vintage Florals - The City Blonde",
        user_id: juan.id
    })
    picture6 = Picture.create(
    {
        image_url: "https://i.pinimg.com/736x/7e/d4/d0/7ed4d07796e8426728f74ca8480bf458.jpg",
        description: "Take remote learning to the mountains and treat the whole family to recess on the slopes.",
        user_id: juan.id
    })
    picture7 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/c5/ab/18/c5ab186f3f3691cc9db1bc366bc95909.jpg",
        description: "You Won’t Be Able To Resist The Detailing In This Hazel…",
        user_id: juan.id
    })
    picture8 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/01/1c/b1/011cb1d62b75d2d0af5f55300f04a63c.jpg",
        description: "30 Best Female Poses for Outdoor and Studio Photoshoots",
        user_id: juan.id
    })
    picture9 = Picture.create(
    {
        image_url: "https://i.pinimg.com/236x/43/f2/c5/43f2c5f407b0d15d3b837b02ab2696f6.jpg",
        description: "my summer bucket list on We Heart It",
        user_id: juan.id
    }
)

Review.create([
    {
    comment: "Well it looks like the Prisoner Partition is back on back full circle",
    picture_id: picture1.id,
    user_id: juan.id
    },

    {
    comment: "I like it",
    picture_id: picture2.id,
    user_id: juan.id
    },

    {
    comment: "Not my style pic",
    picture_id: picture3.id,
    user_id: stela.id
    }
])
