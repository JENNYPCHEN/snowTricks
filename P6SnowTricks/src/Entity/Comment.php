<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Comment
 *
 * @ORM\Table(name="comment", indexes={@ORM\Index(name="fk_comment_trick1_idx", columns={"trick_id"}), @ORM\Index(name="fk_comment_user1_idx", columns={"user_id"})})
 * @ORM\Entity
 */
class Comment
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="message", type="string", length=45, nullable=false)
     */
    private $message;

    /**
     * @var string
     *
     * @ORM\Column(name="create_date", type="string", length=45, nullable=false)
     */
    private $createDate;

    /**
     * @var \Trick
     *
     * @ORM\ManyToOne(targetEntity="Trick")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="trick_id", referencedColumnName="id")
     * })
     */
    private $trick;

    /**
     * @var \User
     *
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     * })
     */
    private $user;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMessage(): ?string
    {
        return $this->message;
    }

    public function setMessage(string $message): self
    {
        $this->message = $message;

        return $this;
    }

    public function getCreateDate(): ?string
    {
        return $this->createDate;
    }

    public function setCreateDate(string $createDate): self
    {
        $this->createDate = $createDate;

        return $this;
    }

    public function getTrick()
    {
        return $this->trick;
    }

    public function setTrick(?Trick $trick): self
    {
        $this->trick = $trick;

        return $this;
    }

    public function getUser()
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }


}
