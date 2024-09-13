<?php
/** @ generate-class-entries */

namespace Win32Service;


final class RightInfo {

    private function __construct() {}
    public function __clone(): void {}
    public function __serialize(): array {}
    public function __unserialize(array $data): void {}
    public function __toString(): string {}
    public function getUsername(): ?string {}
    public function getDomain(): ?string {}
    public function getFullUsername(): ?string {}
    public function getRights(): array {}
    public function isGrantAccess(): bool {}
    public function isDenyAccess(): bool {}
}